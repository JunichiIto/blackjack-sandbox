require './lib/playable'

class Player
  include Playable

  attr_reader :cards

  def initialize(first_card, second_card)
    @cards = [first_card, second_card]
  end
end