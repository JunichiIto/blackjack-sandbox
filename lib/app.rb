require './lib/card'
require './lib/dealer'
require './lib/player'

class App
  def self.run
    self.new.run
  end

  def run
    @cards = generate_cards
    @player = Player.new(*@cards.shift(2))
    @dealer = Dealer.new(*@cards.shift(2))

    puts "ブラックジャックへようこそ！"
    puts "ゲームを開始します。"

    @player.cards.each do |card|
      puts "あなたの引いたカードは#{card}です。"
    end

    puts "ディーラーの引いたカードは#{@dealer.cards[0]}です。"
    puts "ディーラーの2枚目のカードは分かりません。"

    begin
      puts "あなたの現在の得点は#{@player.total}です。"
      puts "カードを引きますか？"
    end while player_hit? && !@player.bust?

    if @player.bust?
      puts "#{@player.total}点でバストしました。"
      puts "あなたの負けです。"
    else
      puts "ディーラーの2枚目のカードは#{@dealer.cards[1]}でした。"

      begin
        puts "ディーラーの現在の得点は#{@dealer.total}です。"
      end while dealer_hit?

      if @dealer.bust?
        puts "#{@dealer.total}点でバストしました。"
        puts "あなたの勝ちです！"
      else
        puts "あなたの得点は#{@player.total}です。"
        puts "ディーラーの得点は#{@dealer.total}です。"

        if @player.total == @dealer.total
          puts "引き分けです。"
        elsif @player.total > @dealer.total
          puts "あなたの勝ちです！"
        else
          puts "あなたの負けです。"
        end
      end
    end

    puts "ブラックジャック終了！また遊んでね★"
  end

  private

  def generate_cards
    Card.generate_cards.shuffle
  end

  def player_hit?
    print "y/n: "
    if STDIN.gets.chomp.downcase == 'y'
      card = @cards.shift
      puts "あなたの引いたカードは#{card}です。"
      @player.hit(card)
      true
    end
  end

  def dealer_hit?
    if @dealer.hit_more?
      card = @cards.shift
      puts "ディーラーの引いたカードは#{card}です。"
      @dealer.hit(card)
      true
    end
  end
end

if __FILE__ == $0
  App.run
end
