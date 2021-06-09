require './lib/turn'
require './lib/card'

RSpec.describe Turn do

  describe '#initialize and attr_reader' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    it 'exists' do
      expect(turn).to be_instance_of(Turn)
    end

    it 'returns a guess attribute' do
      expect(turn.guess).to eq("Juneau")
    end

    it 'returns a card attribute' do
      expect(turn.card).to eq(card)
    end
  end

  describe '#correct? ' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    it 'returns true for correct answer' do
      turn = Turn.new("Juneau", card)
      expect(turn.correct?).to eq(true)
    end

    it 'returns false for incorrect answer' do
      turn = Turn.new("Anchorage", card)
      expect(turn.correct?).to eq(false)
    end

    it 'returns false for blanks answer' do
      turn = Turn.new("", card)
      expect(turn.correct?).to eq(false)
    end
  end

  describe '#feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    it 'returns "Correct!" for correct answer' do
      turn = Turn.new("Juneau", card)
      expect(turn.feedback).to eq("Correct!")
    end

    it 'returns "Incorrect." for incorrect answer' do
      turn = Turn.new("Anchorage", card)
      expect(turn.feedback).to eq("Incorrect.")
    end

    it 'returns "Incorrect." for blank answer' do
      turn = Turn.new("", card)
      expect(turn.feedback).to eq("Incorrect.")
    end
  end
end
