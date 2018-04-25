class Card
  SUITS = [
    HEART = :heart,
    DIAMOND = :diamond,
    CLUB = :club,
    SPADE = :spade
  ]

  NUMBERS = ['A', *'2'..'9', '10', 'J', 'Q', 'K']

  attr_reader :suit, :number

  def self.generate_cards
    SUITS.flat_map { |suit|
      NUMBERS.map { |n|
        self.new(suit, n)
      }
    }
  end

  def initialize(suit, number)
    @suit = suit
    @number = number
  end
end