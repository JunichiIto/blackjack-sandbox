require './lib/card'
require './lib/dealer'
require './lib/player'

class App
  def self.run
    self.new.run
  end

  def run
    init_app
    show_intro
    result = play_game
    show_outro(result)
  end

  private

  def init_app
    @cards = generate_cards
    @player = Player.new(*@cards.shift(2))
    @dealer = Dealer.new(*@cards.shift(2))
  end

  def show_intro
    puts "ブラックジャックへようこそ！"
    puts "ゲームを開始します。"
    puts_blank_row

    @player.cards.each do |card|
      show_player_card(card)
    end

    puts_blank_row

    show_dealer_card(@dealer.cards[0])
    puts "ディーラーの2枚目のカードは分かりません。"

    puts_blank_row
  end

  def play_game
    begin
      puts "あなたの現在の得点は#{@player.total}です。"
      puts "カードを引きますか？"
    end while player_hit? && !@player.bust?

    if @player.bust?
      puts "#{@player.total}点でバストしました。"
      return :lose
    end

    puts_blank_row
    puts "ディーラーの2枚目のカードは#{@dealer.cards[1]}でした。"

    begin
      puts "ディーラーの現在の得点は#{@dealer.total}です。"
      puts_blank_row
    end while dealer_hit?

    if @dealer.bust?
      puts "ディーラーは#{@dealer.total}点でバストしました。"
      return :win
    end

    puts "あなたの得点は#{@player.total}です。"
    puts "ディーラーの得点は#{@dealer.total}です。"

    case @player.total <=> @dealer.total
    when 1 then :win
    when -1 then :lose
    else :draw
    end
  end

  def show_outro(result)
    puts result_text(result)
    puts_blank_row
    puts "ブラックジャック終了！また遊んでね★"
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

  def show_player_card(card)
    puts "あなたの引いたカードは#{card}です。"
  end

  def show_dealer_card(card)
    puts "ディーラーの引いたカードは#{card}です。"
  end

  def result_text(result)
    case result
    when :win then "あなたの勝ちです！"
    when :lose then "あなたの負けです。"
    when :draw then "引き分けです。"
    else raise "Unknown result: #{result}"
    end
  end

  def puts_blank_row
    puts
  end
end

if __FILE__ == $0
  App.run
end
