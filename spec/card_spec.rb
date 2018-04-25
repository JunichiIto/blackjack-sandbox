describe Card do
  describe '.generate_cards' do
    it 'generates 52 cards' do
      cards = Card.generate_cards
      expect(cards.count).to eq 13 * 4

      cards_by_suit = cards.group_by(&:suit)
      expect(cards_by_suit.keys).to contain_exactly(:heart, :diamond, :club, :spade)
      cards_by_suit.values.each do |cards|
        expect(cards.map(&:number)).to contain_exactly(*%w[A 2 3 4 5 6 7 8 9 10 J Q K])
      end
    end
  end

  describe '#point' do
    it 'has a valid point' do
      expect(Card.new(:heart, 'A').point).to eq 1
      expect(Card.new(:heart, '2').point).to eq 2
      expect(Card.new(:heart, '9').point).to eq 9
      expect(Card.new(:heart, '10').point).to eq 10
      expect(Card.new(:heart, 'J').point).to eq 10
      expect(Card.new(:heart, 'Q').point).to eq 10
      expect(Card.new(:heart, 'K').point).to eq 10
    end
  end
end