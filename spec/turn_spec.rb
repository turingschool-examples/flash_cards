require './lib/card'
require "./lib/turn"

describe Turn do
  context '#initialize' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    it 'exists' do
      expect(turn).to be_instance_of(Turn)
    end

    it 'has a card' do
      expect(turn.card).to eq(card)
    end

    it 'has a guess' do
      expect(turn.guess).to eq("Juneau")
    end
  end

  context '#returning answers' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    it 'has a correct answer' do
      expect(turn.correct?).to eq(true)
    end

    it 'can return positive feedback' do
      expect(turn.feedback).to eq("Correct!")
    end

    it 'can be false' do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)
      expect(turn.guess).to eq("Saturn")
      expect(turn.correct?).to eq(false)
      expect(turn.feedback).to eq("Incorrect.")
    end
  end
end
