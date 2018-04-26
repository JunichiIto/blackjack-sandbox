# Blackjack sandbox

CUI blackjack game.

See also: https://qiita.com/hirossyi73/items/cf8648c31898216312e5

## Play sample

```
$ ruby ./lib/app.rb
ブラックジャックへようこそ！
ゲームを開始します。

あなたの引いたカードはスペードのJです。
あなたの引いたカードはクラブの3です。

ディーラーの引いたカードはクラブの5です。
ディーラーの2枚目のカードは分かりません。

あなたの現在の得点は13です。
カードを引きますか？
y/n: y

あなたの引いたカードはスペードの5です。
あなたの現在の得点は18です。
カードを引きますか？
y/n: n

ディーラーの2枚目のカードはダイヤの8でした。
ディーラーの現在の得点は13です。
press return: 

ディーラーの引いたカードはスペードのQです。
ディーラーの現在の得点は23です。
press return: 

ディーラーは23点でバストしました。
あなたの勝ちです！

ブラックジャック終了！また遊んでね★
```

## How to test

```
$ bundle install
$ bundle exec rspec
```

## License

MIT License.
