require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  describe '#initialize' do
    it 'exists' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn).to be_instance_of(Turn)
    end

    it 'has a guess' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.guess).to eq("Juneau")
    end

    it 'has a card' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.card).to be_instance_of(Card)
    end
  end

  describe '#correct?' do
    it 'can verify correctness' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.correct?).to be true

      turn = Turn.new("London", card)

      expect(turn.correct?).to be false
    end
  end

  describe '#feedback' do
    it "gives feedback" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.feedback).to eq("Correct!")

      turn = Turn.new("London", card)

      expect(turn.feedback).to eq("Incorrect.")
    end
  end
end
