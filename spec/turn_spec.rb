require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  describe '#initialize' do
    it 'has a guess' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.guess).to eq("Juneau")
    end

    it 'has a card' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.card).to eq(card)
    end
  end

  describe '#feedback' do
    it 'can tell if guess is correct' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.correct?).to eq(true)
    end

    it 'can tell if a guess is incorrect' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("MaMaMia", card)

      expect(turn.correct?).to eq(false)
    end

    it 'can give feedback for correct answers' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.feedback).to eq("Correct!")
    end

    it 'can give feedback for incorrect answers' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("L.A.", card)
      # require "pry"; binding.pry

      expect(turn.feedback).to eq("Incorrect.")
    end
  end
end
