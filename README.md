# girb-gemini

Google Gemini LLM provider for [girb](https://github.com/rira100000000/girb) (AI-powered IRB assistant).

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

Set your API key:

```bash
export GEMINI_API_KEY=your-api-key
```

Add to your `~/.irbrc`:

```ruby
require 'girb-gemini'
```

That's it! The provider auto-configures when `GEMINI_API_KEY` is set.

## Manual Configuration

```ruby
require 'girb-gemini'

Girb.configure do |c|
  c.provider = Girb::Providers::Gemini.new(
    api_key: ENV['GEMINI_API_KEY'],
    model: 'gemini-2.5-flash'  # default
  )
end
```

## Available Models

- `gemini-2.5-flash` (default) - Fast and efficient
- `gemini-2.5-pro` - More capable, slower

## License

MIT License
