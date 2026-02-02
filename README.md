# girb-gemini

Google Gemini LLM provider for [girb](https://github.com/rira100000000/girb) (AI-powered IRB assistant).

[日本語版 README](README_ja.md)

## Installation

Add to your Gemfile:

```ruby
gem 'girb'
gem 'girb-gemini'
```

Or install directly:

```bash
gem install girb girb-gemini
```

## Setup

### Option 1: Configure in ~/.irbrc (Recommended)

Add to your `~/.irbrc`:

```ruby
require 'girb-gemini'

Girb.configure do |c|
  c.provider = Girb::Providers::Gemini.new(
    api_key: 'your-api-key',
    model: 'gemini-2.5-flash'
  )
end
```

Then use regular `irb` command.

### Option 2: Configure via environment variables

```bash
export GIRB_PROVIDER=girb-gemini
export GIRB_MODEL=gemini-2.5-flash  # optional, defaults to gemini-2.5-flash
export GEMINI_API_KEY=your-api-key
```

Then start with `girb` command.

## Available Models

- `gemini-2.5-flash` (default) - Fast and efficient
- `gemini-2.5-pro` - More capable, slower

## License

MIT License
