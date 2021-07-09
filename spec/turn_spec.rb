require 'rspec'
require './lib/card'
require './lib/turn'

#before each

RSpec.describe Turn do
  describe 'initialize' do

    it 'exists' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn).to be_instance_of(Turn)
    end

    it 'can create a guess' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.guess).to eq("Juneau")
    end

    it 'can have a card' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(card).to eq(card)
    end
  end
  describe 'returns answers based on the card and guess' do

    it 'determines whether true or false by comparing the guess and answer' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      expect(turn.is_correct?).to eq(true)

      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Sacremento", card)
      expect(turn.is_correct?).to eq(false)
    end

    it "returns a string if true or false" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      expect(turn.feedback).to eq("Correct!")
      
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Dog", card)
      expect(turn.feedback).to eq("Incorrect.")
    end
  end
end
