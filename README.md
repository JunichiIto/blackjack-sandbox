# Blackjack sandbox

CUI blackjack game.

See also: https://qiita.com/hirossyi73/items/cf8648c31898216312e5

## Play sample

```
$ ruby ./lib/app.rb
ブラックジャックへようこそ！

【第1回戦】
ゲームを開始します。

あなたの引いたカードはダイヤの6です。
あなたの引いたカードはハートの5です。

ディーラーの引いたカードはスペードの2です。
ディーラーの2枚目のカードは分かりません。

あなたの現在の得点は11です。
カードを引きますか？
y/n: y

あなたの引いたカードはダイヤのJです。
あなたの得点は21です。
press return: 

ディーラーの2枚目のカードはクラブの9でした。
ディーラーの現在の得点は11です。
press return: 

ディーラーの引いたカードはスペードのAです。
ディーラーの現在の得点は12です。
press return: 

ディーラーの引いたカードはダイヤの5です。
ディーラーの現在の得点は17です。
press return: 

あなたの得点は21です。
ディーラーの得点は17です。
あなたの勝ちです！

対戦成績: 1勝0敗0分
勝率: 100.0%

ブラックジャック終了！もう一度遊びますか？
y/n: n

さようなら。また遊んでね★
```

## How to test

```
$ bundle install
$ bundle exec rspec
```

## License

MIT License.
