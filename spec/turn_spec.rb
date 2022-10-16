require 'rspec'
require './lib/turn'

RSpec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
  
        expect(turn).to be_a (Turn)
    end

    it 'can have a card with attributes' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.card).to eq (card)
    end

    it 'can accept a guess' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.guess).to eq ("Juneau")
    end

    it 'can return true if a guess is correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.correct?).to eq (true)
    end

    it 'can return "Correct!" if answer is true' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.feedback).to eq ("Correct!")
    end 

    it 'can return false if a guess is incorrect' do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)

        expect(turn.correct?).to eq (false)
    end

    it 'can return "Incorrect!" if answer is true' do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)

        expect(turn.feedback).to eq ("Incorrect.")
    end 
    
end
  