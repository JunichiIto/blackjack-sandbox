describe Player do
  describe '#total, #hit' do
    it 'behaves properly' do
      player = Player.new(Card.new(:heart, 'J'), Card.new(:heart, '6'))
      expect(player.total).to eq 16

      player.hit(Card.new(:heart, 'A'))
      expect(player.total).to eq 17
    end
  end

  describe '#bust?' do
    context 'equal to 21' do
      it 'returns false' do
        player = Player.new(Card.new(:heart, 'J'), Card.new(:heart, 'Q'))
        player.hit(Card.new(:heart, 'A'))
        expect(player.total).to eq 21
        expect(player.bust?).to be_falsey
      end
    end
    context 'greater than 21' do
      it 'returns false' do
        player = Player.new(Card.new(:heart, 'J'), Card.new(:heart, 'Q'))
        player.hit(Card.new(:heart, '2'))
        expect(player.total).to eq 22
        expect(player.bust?).to be_truthy
      end
    end
  end
end