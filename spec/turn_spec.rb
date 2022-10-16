require './lib/turn'
require 'rspec'

describe Turn do
  describe '#initialize' do
    it 'exists' do

      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn).to be_a Turn
    end

    it 'can have different guesses' do

      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn_1 = Turn.new("Juneau", card)
      turn_2 = Turn.new("Austin", card)

      expect(turn_1.guess).to eq 'Juneau'
      expect(turn_2.guess).to eq 'Austin'
    end

    it 'has a card' do

      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.card).to eq(card)

    end
  end

  describe '#correct?' do
    it 'shows true or false for guess' do

      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn_1 = Turn.new("Juneau", card)
      turn_2 = Turn.new("Austin", card)

      expect(turn_1.correct?).to be true
      expect(turn_2.correct?).to be false

    end

    it 'returns correct regardless of capitalization' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn_1 = Turn.new("Juneau", card)
      turn_2 = Turn.new("juneau", card)

      expect(turn_1.correct?).to be true
      expect(turn_2.correct?).to be true

    end

    it 'returns correct regardless of spaces between answer words' do
      card = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      turn_1 = Turn.new("north north west", card)
      turn_2 = Turn.new("northnorthwest", card)
      turn_3 = Turn.new("north northwest", card)

      expect(turn_1.correct?).to be true
      expect(turn_2.correct?).to be true
      expect(turn_3.correct?).to be true

    end

    it 'returns incorrect if answer words are out of order' do
      card = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      turn = Turn.new("north west north", card)

      expect(turn.correct?).to be false
    end

  end

  describe '#feedback' do
    it 'returns correct or incorrect' do

      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn_1 = Turn.new("Juneau", card)
      turn_2 = Turn.new("Austin", card)

      expect(turn_1.feedback).to eq 'Correct!'
      expect(turn_2.feedback).to eq "Incorrect.\nThe correct answer is #{card.answer}"
    end
  end
end
