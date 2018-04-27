require './lib/playable'

class Player
  include Playable

  attr_reader :cards

  def initialize(first_card, second_card)
    @cards = [first_card, second_card]
    @stand = false
  end

  def finished?
    total >= 21 || stand?
  end

  def twenty_one?
    total == 21
  end

  def stand!
    @stand = true
  end

  def stand?
    @stand
  end
end