require './lib/card'
require './lib/turn'

RSpec.describe Turn do

  context 'class set up' do

    it 'exists' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn).to be_instance_of(Turn)
    end

  end

  context 'class attributes' do

    it 'has a card' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.card).to eq(card)
    end

    it 'has a guess' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.guess).to eq("Juneau")
    end

  end

  context 'class methods' do

    it 'is guess correct? - true' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.correct?).to eq(true)
    end

    it 'is guess correct? - false' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Denver", card)

      expect(turn.correct?).to eq(false)
    end

    it 'provides feedback for correct answers' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.feedback).to eq("Correct!")
    end

    it 'provides feedback for incorrect answers' do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)

      expect(turn.feedback).to eq("Incorrect.")
    end

  end

end
