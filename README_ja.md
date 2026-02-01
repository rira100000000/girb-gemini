# girb-gemini

[girb](https://github.com/rira100000000/girb)（AI搭載IRBアシスタント）用のGoogle Gemini LLMプロバイダー。

## インストール

Gemfileに追加:

```ruby
gem 'girb'
gem 'girb-gemini'
```

または直接インストール:

```bash
gem install girb girb-gemini
```

## セットアップ

APIキーを設定:

```bash
export GEMINI_API_KEY=your-api-key
```

`~/.irbrc` に追加:

```ruby
require 'girb-gemini'
```

これだけです！`GEMINI_API_KEY`が設定されていれば自動でプロバイダーが設定されます。

## 手動設定

```ruby
require 'girb-gemini'

Girb.configure do |c|
  c.provider = Girb::Providers::Gemini.new(
    api_key: ENV['GEMINI_API_KEY'],
    model: 'gemini-2.5-flash'  # デフォルト
  )
end
```

## 利用可能なモデル

- `gemini-2.5-flash` (デフォルト) - 高速で効率的
- `gemini-2.5-pro` - より高性能、やや遅い

## ライセンス

MIT License
