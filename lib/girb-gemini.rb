# frozen_string_literal: true

require "girb"
require_relative "girb/providers/gemini"

# Auto-configure Gemini provider if API key is available
if ENV["GEMINI_API_KEY"]
  Girb.configure do |c|
    unless c.provider
      c.provider = Girb::Providers::Gemini.new(
        api_key: ENV["GEMINI_API_KEY"],
        model: c.model || "gemini-2.5-flash"
      )
    end
  end
end
