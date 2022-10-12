require './lib/turn'
require './lib/card'
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
  end
end
