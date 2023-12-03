require './lib/card'
require './lib/turn'


RSpec.describe Turn do
  let(:card) { Card.new("What is the capital of Alaska?", "Juneau", :Geography) }

  describe '#initialize' do
    it 'is an instance of Turn' do
      turn = Turn.new("Juneau", card)

      expect(turn).to be_a Turn
    end
  end

    it 'has a guess' do
      turn = Turn.new("Juneau", card)

      expect(turn.guess).to eq ("Juneau")
  end

    it 'has a card' do
      turn = Turn.new("Juneau", card)

      expect(turn.card.question).to eq ("What is the capital of Alaska?")
      expect(turn.card.answer).to eq ("Juneau")
      expect(turn.card.category).to eq (:Geography)
  end

  describe '#correct?' do
    it 'return true if the guess is correct' do
      turn = Turn.new("Juneau", card)

      expect(turn.correct?).to eq (true)
    end

    it 'return false if the guess is incorrect' do
      turn = Turn.new("Little Rock", card)

      expect(turn.correct?).to eq (false)
    end
  end

  describe '#feedback' do
    it 'return the guess result' do
      turn = Turn.new("Juneau", card)

      expect(turn.feedback).to eq ("Correct!")

      turn_2 = Turn.new("Little Rock", card)

      expect(turn_2.feedback).to eq ("Incorrect.")
    end
  end
end
