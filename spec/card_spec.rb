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
end