require 'rspec'
require './lib/turn'
require './lib/card'


describe 'Iteration 1' do
  describe 'Turn' do
    describe '#initialize' do

      it "it exists" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_a(Turn)
      end

      it "has a guess" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.guess).to eq("Juneau")
      end
      it "has a card" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.card).to be_a(Card)
      end
    end

    describe '#correct?' do
      it 'is true or false'

    end

  end
end
