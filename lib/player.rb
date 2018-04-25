class Player
  def initialize(first_card, second_card)
    @cards = [first_card, second_card]
  end

  def hit(card)
    @cards << card
  end

  def total
    @cards.map(&:point).sum
  end

  def bust?
    total > 21
  end
end