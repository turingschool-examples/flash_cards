require 'rspec'
require './lib/turn'
require './lib/card'
require 'pry'

describe Turn do
    it 'exists' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("iPhone", carabiner)

      expect(turn).to be_instance_of(Turn)
    end

    it 'read the guess' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau",card)
      expect(turn.guess).to eq("Juneau")
    end

    it 'reads the card instance' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau",card)
      expect(turn.card).to eq(card)
    end

    it 'checks the guess' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau",card)
      expect(turn.correct?).to be true
    end

    it 'gives feedback if correct' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau",card)
      expect(turn.feedback).to eq("Correct!")
    end

    it 'gives feedback if incorrect' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Wrong answer",card)
      expect(turn.feedback).to eq("Incorrect.")
    end
  end
