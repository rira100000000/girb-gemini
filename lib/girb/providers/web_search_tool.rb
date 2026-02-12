# frozen_string_literal: true

module Girb
  module Providers
    class WebSearchTool < Girb::Tools::Base
      @client = nil
      @model = nil

      class << self
        attr_accessor :client, :model

        def tool_name
          "web_search"
        end

        def description
          "Search the web for current information. Use this when you need up-to-date information " \
          "that may not be in your training data, such as latest API documentation, recent changes " \
          "to libraries/frameworks, current error messages, or any real-time information."
        end

        def parameters
          {
            type: "object",
            properties: {
              query: {
                type: "string",
                description: "The search query. Be specific and include version numbers or dates when relevant."
              }
            },
            required: ["query"]
          }
        end

        def available?
          !@client.nil?
        end
      end

      def execute(binding, query:)
        client = self.class.client
        model = self.class.model
        return { error: "Web search not configured" } unless client

        response = client.generate_content(
          query,
          model: model,
          google_search: true
        )

        text = response.text || ""
        sources = format_sources(response)

        {
          result: text,
          sources: sources
        }
      rescue StandardError => e
        { error: "Web search failed: #{e.message}" }
      end

      private

      def format_sources(response)
        return [] unless response.respond_to?(:grounded?) && response.grounded?

        response.grounding_sources.map do |s|
          "#{s[:title]}: #{s[:url]}"
        end
      rescue
        []
      end
    end
  end
end
