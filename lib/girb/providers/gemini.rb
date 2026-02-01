# frozen_string_literal: true

require "gemini"
require "girb/providers/base"

module Girb
  module Providers
    class Gemini < Base
      DEFAULT_MODEL = "gemini-2.5-flash"

      def initialize(api_key:, model: DEFAULT_MODEL)
        @client = ::Gemini::Client.new(api_key)
        @model = model
      end

      def chat(messages:, system_prompt:, tools:)
        contents = convert_messages(messages)
        tools_param = build_tools_param(tools)

        response = @client.chat(parameters: {
          model: @model,
          system_instruction: { parts: [{ text: system_prompt }] },
          contents: contents,
          tools: tools_param
        }.compact)

        parse_response(response)
      rescue Faraday::BadRequestError => e
        Response.new(error: "API Error: #{e.message}")
      rescue StandardError => e
        Response.new(error: "Error: #{e.message}")
      end

      private

      def convert_messages(messages)
        messages.map do |msg|
          case msg[:role]
          when :user
            { role: "user", parts: [{ text: msg[:content] }] }
          when :assistant
            { role: "model", parts: [{ text: msg[:content] }] }
          when :tool_call
            {
              role: "model",
              parts: [{
                function_call: {
                  name: msg[:name],
                  args: msg[:args]
                }
              }]
            }
          when :tool_result
            {
              role: "user",
              parts: [{
                function_response: {
                  name: msg[:name],
                  response: msg[:result]
                }
              }]
            }
          else
            { role: "user", parts: [{ text: msg[:content].to_s }] }
          end
        end
      end

      def build_tools_param(tools)
        return nil if tools.empty?

        gemini_tools = ::Gemini::ToolDefinition.new

        tools.each do |tool|
          gemini_tools.add_function(
            tool[:name].to_sym,
            description: tool[:description]
          ) do
            properties = tool.dig(:parameters, :properties) || {}
            required = tool.dig(:parameters, :required) || []

            properties.each do |prop_name, prop_def|
              type = prop_def[:type]&.to_sym || :string
              desc = prop_def[:description] || ""
              is_required = required.include?(prop_name.to_s) || required.include?(prop_name)

              property prop_name, type: type, description: desc, required: is_required
            end
          end
        end

        declarations = gemini_tools.to_h[:function_declarations]
        declarations ? [{ function_declarations: declarations }] : nil
      end

      def parse_response(response)
        return Response.new(error: "No response") unless response

        text = response.text
        function_calls = parse_function_calls(response)

        if response.respond_to?(:error) && response.error
          Response.new(error: response.error, raw_response: response)
        else
          Response.new(text: text, function_calls: function_calls, raw_response: response)
        end
      end

      def parse_function_calls(response)
        return [] unless response.function_calls&.any?

        response.function_calls.map do |fc|
          {
            name: fc["name"],
            args: fc["args"] || {}
          }
        end
      end
    end
  end
end
