module Playable
  def hit(card)
    cards << card
  end

  def total
    cards.map(&:point).sum
  end

  def bust?
    total > 21
  end

  def finished?
    !hit_more?
  end
end