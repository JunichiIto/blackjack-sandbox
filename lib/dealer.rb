require './lib/playable'

class Dealer
  include Playable

  attr_reader :cards

  def initialize(first_card, second_card)
    @cards = [first_card, second_card]
  end

  def finished?
    total >= 17
  end
end