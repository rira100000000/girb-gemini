# frozen_string_literal: true

require_relative "lib/girb-gemini/version"

Gem::Specification.new do |spec|
  spec.name = "girb-gemini"
  spec.version = GirbGemini::VERSION
  spec.authors = ["rira100000000"]
  spec.email = ["101010hayakawa@gmail.com"]

  spec.summary = "Gemini provider for girb"
  spec.description = "Google Gemini LLM provider for girb (AI-powered IRB assistant). " \
                     "Install this gem to use Gemini as your LLM backend."
  spec.homepage = "https://github.com/rira100000000/girb-gemini"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_dependency "girb", "~> 0.1"
  spec.add_dependency "ruby-gemini-api", "~> 1.0"
end
