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

### 方法1: ~/.irbrcで設定（推奨）

`~/.irbrc` に追加:

```ruby
require 'girb-gemini'

Girb.configure do |c|
  c.provider = Girb::Providers::Gemini.new(
    api_key: 'your-api-key',
    model: 'gemini-2.5-flash'
  )
end
```

通常の `irb` コマンドで使用できます。

### 方法2: 環境変数で設定

```bash
export GIRB_PROVIDER=girb-gemini
export GIRB_MODEL=gemini-2.5-flash  # オプション、デフォルトは gemini-2.5-flash
export GEMINI_API_KEY=your-api-key
```

`girb` コマンドで起動します。

## 利用可能なモデル

- `gemini-2.5-flash` (デフォルト) - 高速で効率的
- `gemini-2.5-pro` - より高性能、やや遅い

## ライセンス

MIT License
