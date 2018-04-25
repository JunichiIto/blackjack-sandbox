class Dealer
  def initialize(first_card, second_card)
    @cards = [first_card, second_card]
  end

  def first_card
    @cards[0]
  end

  def second_card
    @cards[1]
  end

  def hit(card)
    @cards << card
  end

  def total
    @cards.map(&:point).sum
  end

  def hit_more?
    total < 17
  end

  def bust?
    total > 21
  end
end