require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'
require 'pry'

RSpec.describe Turn do
    it "exists" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
    
        expect(turn).to be_a(Turn)
      end
    
      it "has a card" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
    
        expect(turn.card).to eq(card)
      end
    
      it "has a guess" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
    
        expect(turn.guess).to eq("Juneau")
      end
    
      it "can check if a guess is correct" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
    
        expect(turn.correct?).to eq(true)
      end
    
      it "can check if a guess is incorrect" do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)
    
        expect(turn.correct?).to eq(false)
      end
    
      it "provides feedback for a correct guess" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
    
        expect(turn.feedback).to eq("Correct!")
      end
    
      it "provides feedback for an incorrect guess" do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)
    
        expect(turn.feedback).to eq("Incorrect.")
      end
  end