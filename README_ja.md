# girb-gemini

[girb](https://github.com/rira100000000/girb)（AI搭載IRBアシスタント）用のGoogle Gemini LLMプロバイダー。

## インストール

### Railsプロジェクトの場合

Gemfileに追加:

```ruby
group :development do
  gem 'girb-gemini'
end
```

そして実行:

```bash
bundle install
```

プロジェクトルートに `.girbrc` ファイルを作成:

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

これで `rails console` が自動的にgirbを読み込みます！

### 非Railsプロジェクトの場合

グローバルにインストール:

```bash
gem install girb girb-gemini
```

プロジェクトディレクトリに `.girbrc` ファイルを作成:

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

`irb` の代わりに `girb` コマンドを使用します。

## 設定

APIキーを環境変数として設定:

```bash
export GEMINI_API_KEY=your-api-key
```

## 利用可能なモデル

- `gemini-2.5-flash` (デフォルト) - 高速で効率的
- `gemini-2.5-pro` - より高性能、やや遅い

## 代替: 環境変数での設定

`girb` コマンドでは、`.girbrc` が見つからない場合に環境変数で設定することもできます:

```bash
export GIRB_PROVIDER=girb-gemini
export GIRB_MODEL=gemini-2.5-flash  # オプション、デフォルトは gemini-2.5-flash
export GEMINI_API_KEY=your-api-key
girb
```

## ライセンス

MIT License
