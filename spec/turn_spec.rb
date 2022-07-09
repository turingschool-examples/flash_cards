require 'rspec'
require './lib/card'
require './lib/turn'


RSpec.describe Turn do

    before :each do
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @turn = Turn.new("Juneau", @card)
    end

    it 'class should exist' do#pass
        expect(@turn).to be_instance_of Turn
    end

    it 'should return guess' do #w
        expect(@turn.guess).to eq('Juneau') 
    end

    it 'should return card' do
        expect(@turn.card).to eq(@card) 
    end

    xit 'should return correct?' do#will fail
        expect(@turn.correct?).to eq(true)
    end

    xit 'should return feedback' do
        expect(@turn.feedback).to eq(card) 
    end
    

end