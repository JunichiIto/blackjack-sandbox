require './lib/playable'

class Player
  include Playable

  attr_reader :cards

  def initialize(first_card, second_card)
    @cards = [first_card, second_card]
  end

  def hit_more?
    total < 21
  end

  def twenty_one?
    total == 21
  end
end