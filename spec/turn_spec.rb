require 'rspec'
require './lib/turn'
require './lib/card'

describe Turn do
  describe '#initialize' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    it 'is a turn' do
      expect(turn).to be_instance_of(Turn)
    end
    it 'has a card ' do
      expect(turn.card).to eq (card)
    end
    it "is has guess" do
      expect(turn.guess).to eq("Juneau")
    end
  end

  describe "#correct?" do
    it 'checks if guess matches answer' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      expect(turn.correct?).to be true
    end

    it 'checks if guess matches answer' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("new york", card)
      expect(turn.correct?).to be false
    end
  end

  describe '#feedback' do
    it 'prints string if value is true' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      turn.guess
      expect(turn.correct?).to be true
    end

    it 'prints string if value is false' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("new york", card)
      turn.guess
      expect(turn.correct?).to be false
    end
  end
end
