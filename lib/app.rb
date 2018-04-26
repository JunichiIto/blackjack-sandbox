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
      show_player_card(card)
    end

    show_dealer_card(@dealer.cards[0])
    puts "ディーラーの2枚目のカードは分かりません。"

    begin
      puts "あなたの現在の得点は#{@player.total}です。"
      puts "カードを引きますか？"
    end while player_hit? && !@player.bust?

    if @player.bust?
      puts "#{@player.total}点でバストしました。"
      result = :lose
    else
      puts "ディーラーの2枚目のカードは#{@dealer.cards[1]}でした。"

      begin
        puts "ディーラーの現在の得点は#{@dealer.total}です。"
      end while dealer_hit?

      if @dealer.bust?
        puts "#{@dealer.total}点でバストしました。"
        result = :win
      else
        puts "あなたの得点は#{@player.total}です。"
        puts "ディーラーの得点は#{@dealer.total}です。"

        if @player.total == @dealer.total
          result = :draw
        elsif @player.total > @dealer.total
          result = :win
        else
          result = :lose
        end
      end
    end

    result_text =
      case result
      when :win then "あなたの勝ちです！"
      when :lose then "あなたの負けです。"
      when :draw then "引き分けです。"
      else raise "Unknown result: #{result}"
      end

    puts result_text
    puts "ブラックジャック終了！また遊んでね★"
  end

  private

  def show_player_card(card)
    puts "あなたの引いたカードは#{card}です。"
  end

  def show_dealer_card(card)
    puts "ディーラーの引いたカードは#{card}です。"
  end

  def judge

  end

  def generate_cards
    Card.generate_cards.shuffle
  end

  def player_hit?
    print "y/n: "
    if STDIN.gets.chomp.downcase == 'y'
      card = @cards.shift
      show_player_card(card)
      @player.hit(card)
      true
    end
  end

  def dealer_hit?
    if @dealer.hit_more?
      card = @cards.shift
      show_dealer_card(card)
      @dealer.hit(card)
      true
    end
  end
end

if __FILE__ == $0
  App.run
end
