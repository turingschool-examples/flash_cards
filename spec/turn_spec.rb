require './lib/turn'
require './lib/card'
require 'pry'

RSpec.describe Turn do
    it "initializes with guess and card" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn.guess).to eq "Juneau"
        expect(turn.card).to eq card
    end

    
      it 'true when it is correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn.correct?).to be true
      end

      it 'is false when incorrect' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Venus", card)
        expect(turn.correct?).to be false
      end
    
    it "returns correct! when correct" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      expect(turn.feedback).to eq "Correct!"
    end
    
    it "returns 'Incorrect.' when guess is incorrect" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Venus", card)
      expect(turn.feedback).to eq "Incorrect."
    end
  
end