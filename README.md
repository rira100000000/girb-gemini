# girb-gemini

Google Gemini LLM provider for [girb](https://github.com/rira100000000/girb) (AI-powered IRB assistant).

[日本語版 README](README_ja.md)

## Installation

### For Rails Projects

Add to your Gemfile:

```ruby
group :development do
  gem 'girb-gemini'
end
```

Then run:

```bash
bundle install
```

Create a `.girbrc` file in your project root:

```ruby
# .girbrc
require 'girb-gemini'

Girb.configure do |c|
  c.provider = Girb::Providers::Gemini.new(
    api_key: ENV['GEMINI_API_KEY'],
    model: 'gemini-2.5-flash'
  )
end
```

Now `rails console` will automatically load girb!

### For Non-Rails Projects

Install globally:

```bash
gem install girb girb-gemini
```

Create a `.girbrc` file in your project directory:

```ruby
# .girbrc
require 'girb-gemini'

Girb.configure do |c|
  c.provider = Girb::Providers::Gemini.new(
    api_key: ENV['GEMINI_API_KEY'],
    model: 'gemini-2.5-flash'
  )
end
```

Then use `girb` command instead of `irb`.

## Configuration

Set your API key as an environment variable:

```bash
export GEMINI_API_KEY=your-api-key
```

## Available Models

- `gemini-2.5-flash` (default) - Fast and efficient
- `gemini-2.5-pro` - More capable, slower

## Alternative: Environment Variable Configuration

For the `girb` command, you can also configure via environment variables (used when no `.girbrc` is found):

```bash
export GIRB_PROVIDER=girb-gemini
export GIRB_MODEL=gemini-2.5-flash  # optional, defaults to gemini-2.5-flash
export GEMINI_API_KEY=your-api-key
girb
```

## License

MIT License
