describe Dealer do
  describe '#first_card, #second_cars, #total, #hit' do
    it 'behaves properly' do
      dealer = Dealer.new(Card.new(:heart, 'J'), Card.new(:heart, '6'))
      expect(dealer.first_card).to have_attributes(suit: :heart, number: 'J')
      expect(dealer.second_card).to have_attributes(suit: :heart, number: '6')
      expect(dealer.total).to eq 16

      dealer.hit(Card.new(:heart, 'A'))
      expect(dealer.total).to eq 17
    end
  end

  describe '#hit_more?' do
    context 'less than 17' do
      it 'returns true' do
        dealer = Dealer.new(Card.new(:heart, 'J'), Card.new(:heart, '6'))
        expect(dealer.hit_more?).to be_truthy
      end
    end
    context 'equal to 17' do
      it 'returns false' do
        dealer = Dealer.new(Card.new(:heart, 'J'), Card.new(:heart, '7'))
        expect(dealer.hit_more?).to be_falsey
      end
    end
  end

  describe '#bust?' do
    context 'equal to 21' do
      it 'returns false' do
        dealer = Dealer.new(Card.new(:heart, 'J'), Card.new(:heart, 'Q'))
        dealer.hit(Card.new(:heart, 'A'))
        expect(dealer.total).to eq 21
        expect(dealer.bust?).to be_falsey
      end
    end
    context 'greater than 21' do
      it 'returns false' do
        dealer = Dealer.new(Card.new(:heart, 'J'), Card.new(:heart, 'Q'))
        dealer.hit(Card.new(:heart, '2'))
        expect(dealer.total).to eq 22
        expect(dealer.bust?).to be_truthy
      end
    end
  end
end