require 'rspec'
require './lib/card'
require './lib/turn'

describe Turn do 
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    it 'exists' do
       turn = Turn.new("Juneau", card)

       expect(turn).to be_instance_of(Turn)
    end 
    
    it 'has a guess' do 
        turn = Turn.new("Juneau", card)
        
        expect(turn.guess).to eq("Juneau")
    end

    it 'has a card' do
        turn = Turn.new("Juneau", card)

        expect(turn.card).to eq(card)
    end

    it 'checks if correct or incorrect' do
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq(true)
    end

    
    


    


