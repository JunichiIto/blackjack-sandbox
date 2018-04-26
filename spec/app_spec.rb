describe App do
  describe '#run' do
    context 'when dealer wins' do
      context 'and player busts' do
        let(:cards) do
          [
            Card.new(:spade, 'K'),
            Card.new(:diamond, 'J'),
            Card.new(:diamond, '3'),
            Card.new(:diamond, '4'),
            Card.new(:heart, 'Q'),
          ]
        end
        let(:expected) do
          <<~TEXT
            ブラックジャックへようこそ！
            ゲームを開始します。
            あなたの引いたカードはスペードのKです。
            あなたの引いたカードはダイヤのJです。
            ディーラーの引いたカードはダイヤの3です。
            ディーラーの2枚目のカードは分かりません。
            あなたの現在の得点は20です。
            カードを引きますか？
            y/n: あなたの引いたカードはハートのQです。
            30点でバストしました。
            あなたの負けです。
            ブラックジャック終了！また遊んでね★
          TEXT
        end
        example do
          app = App.new
          allow(app).to receive(:generate_cards).and_return(cards)
          allow(STDIN).to receive(:gets).and_return('y')
          expect { app.run }.to output(expected).to_stdout
        end
      end

      context 'and dealer is greater than player' do
        let(:cards) do
          [
            Card.new(:club, '7'),
            Card.new(:spade, 'K'),
            Card.new(:spade, '8'),
            Card.new(:heart, '3'),
            Card.new(:diamond, '8'),
          ]
        end
        let(:expected) do
          <<~TEXT
            ブラックジャックへようこそ！
            ゲームを開始します。
            あなたの引いたカードはクラブの7です。
            あなたの引いたカードはスペードのKです。
            ディーラーの引いたカードはスペードの8です。
            ディーラーの2枚目のカードは分かりません。
            あなたの現在の得点は17です。
            カードを引きますか？
            y/n: ディーラーの2枚目のカードはハートの3でした。
            ディーラーの現在の得点は11です。
            ディーラーの引いたカードはダイヤの8です。
            ディーラーの現在の得点は19です。
            あなたの得点は17です。
            ディーラーの得点は19です。
            あなたの負けです。
            ブラックジャック終了！また遊んでね★
          TEXT
        end
        example do
          app = App.new
          allow(app).to receive(:generate_cards).and_return(cards)
          allow(STDIN).to receive(:gets).and_return('n')
          expect { app.run }.to output(expected).to_stdout
        end
      end
    end

    context 'when player wins' do
      context 'and dealer busts' do
        let(:cards) do
          [
            Card.new(:club, 'J'),
            Card.new(:club, '8'),
            Card.new(:diamond, '7'),
            Card.new(:club, '7'),
            Card.new(:diamond, '8'),
          ]
        end
        let(:expected) do
          <<~TEXT
            ブラックジャックへようこそ！
            ゲームを開始します。
            あなたの引いたカードはクラブのJです。
            あなたの引いたカードはクラブの8です。
            ディーラーの引いたカードはダイヤの7です。
            ディーラーの2枚目のカードは分かりません。
            あなたの現在の得点は18です。
            カードを引きますか？
            y/n: ディーラーの2枚目のカードはクラブの7でした。
            ディーラーの現在の得点は14です。
            ディーラーの引いたカードはダイヤの8です。
            ディーラーの現在の得点は22です。
            22点でバストしました。
            あなたの勝ちです！
            ブラックジャック終了！また遊んでね★
          TEXT
        end
        example do
          app = App.new
          allow(app).to receive(:generate_cards).and_return(cards)
          allow(STDIN).to receive(:gets).and_return('n')
          expect { app.run }.to output(expected).to_stdout
        end
      end

      context 'and player is greater than dealer' do
        let(:cards) do
          [
            Card.new(:club, '7'),
            Card.new(:spade, 'K'),
            Card.new(:spade, '8'),
            Card.new(:heart, '3'),
            Card.new(:spade, '3'),
            Card.new(:diamond, '8'),
          ]
        end
        let(:expected) do
          <<~TEXT
            ブラックジャックへようこそ！
            ゲームを開始します。
            あなたの引いたカードはクラブの7です。
            あなたの引いたカードはスペードのKです。
            ディーラーの引いたカードはスペードの8です。
            ディーラーの2枚目のカードは分かりません。
            あなたの現在の得点は17です。
            カードを引きますか？
            y/n: あなたの引いたカードはスペードの3です。
            あなたの現在の得点は20です。
            カードを引きますか？
            y/n: ディーラーの2枚目のカードはハートの3でした。
            ディーラーの現在の得点は11です。
            ディーラーの引いたカードはダイヤの8です。
            ディーラーの現在の得点は19です。
            あなたの得点は20です。
            ディーラーの得点は19です。
            あなたの勝ちです！
            ブラックジャック終了！また遊んでね★
          TEXT
        end
        example do
          app = App.new
          allow(app).to receive(:generate_cards).and_return(cards)
          allow(STDIN).to receive(:gets).and_return('y', 'n')
          expect { app.run }.to output(expected).to_stdout
        end
      end
    end

    context 'when draws' do
      let(:cards) do
        [
          Card.new(:club, '7'),
          Card.new(:spade, 'K'),
          Card.new(:spade, '8'),
          Card.new(:heart, '3'),
          Card.new(:diamond, '6'),
        ]
      end
      let(:expected) do
        <<~TEXT
          ブラックジャックへようこそ！
          ゲームを開始します。
          あなたの引いたカードはクラブの7です。
          あなたの引いたカードはスペードのKです。
          ディーラーの引いたカードはスペードの8です。
          ディーラーの2枚目のカードは分かりません。
          あなたの現在の得点は17です。
          カードを引きますか？
          y/n: ディーラーの2枚目のカードはハートの3でした。
          ディーラーの現在の得点は11です。
          ディーラーの引いたカードはダイヤの6です。
          ディーラーの現在の得点は17です。
          あなたの得点は17です。
          ディーラーの得点は17です。
          引き分けです。
          ブラックジャック終了！また遊んでね★
        TEXT
      end
      example do
        app = App.new
        allow(app).to receive(:generate_cards).and_return(cards)
        allow(STDIN).to receive(:gets).and_return('n')
        expect { app.run }.to output(expected).to_stdout
      end
    end
  end
end