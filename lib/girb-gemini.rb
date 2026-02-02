# frozen_string_literal: true

require "girb"
require_relative "girb/providers/gemini"

DEFAULT_MODEL = "gemini-2.5-flash"

# Auto-configure Gemini provider if API key is available
if ENV["GEMINI_API_KEY"]
  model = ENV["GIRB_MODEL"] || DEFAULT_MODEL

  Girb.configure do |c|
    c.provider ||= Girb::Providers::Gemini.new(
      api_key: ENV["GEMINI_API_KEY"],
      model: model
    )
  end
end
