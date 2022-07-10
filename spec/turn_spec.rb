require 'rspec'
require './lib/card'
require './lib/turn'

describe Turn do
    it 'exists' do
        card = Card.new("What is a Giant Panda's favorite food", "Bamboo", :Animals)
        turn = Turn.new("Bamboo", card)
        
        expect(turn).to be_instance_of(Turn)
        expect(card).to be_a(Card)
    end

    it 'has a guess' do
        card = Card.new("What is a Giant Panda's favorite food", "Bamboo", :Animals)
        turn = Turn.new("Bamboo", card)
    
        expect(turn.guess).to eq("Bamboo")
    end

    it 'can recognize a correct answer' do
        card = Card.new("What is a Giant Panda's favorite food", "Bamboo", :Animals)
        turn = Turn.new("Bamboo", card)

        expect(turn.correct?).to eq true
    end

    it 'can respond to an incorrect guess' do
        card = Card.new("What is a Giant Panda's favorite food", "Bamboo", :Animals)
        turn = Turn.new("Giant Panda Babies", card)

        expect(turn.response).to eq "Wrong!"
    end
end



