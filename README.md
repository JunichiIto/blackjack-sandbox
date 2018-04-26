# Blackjack sandbox

CUI blackjack game.

See also: https://qiita.com/hirossyi73/items/cf8648c31898216312e5

## Play sample

```
$ ruby ./lib/app.rb
ブラックジャックへようこそ！
ゲームを開始します。

あなたの引いたカードはスペードの6です。
あなたの引いたカードはクラブのJです。

ディーラーの引いたカードはダイヤの4です。
ディーラーの2枚目のカードは分かりません。

あなたの現在の得点は16です。
カードを引きますか？
y/n: n

ディーラーの2枚目のカードはハートの2でした。
ディーラーの現在の得点は6です。
press return: 

ディーラーの引いたカードはクラブのQです。
ディーラーの現在の得点は16です。
press return: 

ディーラーの引いたカードはスペードの2です。
ディーラーの現在の得点は18です。
press return: 

あなたの得点は16です。
ディーラーの得点は18です。
あなたの負けです。

ブラックジャック終了！また遊んでね★
```

## How to test

```
$ bundle install
$ bundle exec rspec
```

## License

MIT License.
