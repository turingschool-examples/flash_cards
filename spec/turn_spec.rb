require 'rspec'
require './lib/turn'

RSpec.describe Turn do
    before :each do
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#access to card via line 1 of the turn file; 
        @turn = Turn.new("Juneau", @card)
#defining the methods here that will be used in tests below
# require 'pry'; binding.pry

end

    it 'class should exist' do#pass
        expect(@turn).to be_instance_of Turn
    end

    it 'should return guess' do #w
        expect(@turn.guess).to eq('Juneau') 
#eq to response from L8
    end

    it 'should return card' do
        expect(@turn.card).to eq(@card) 
    end

    it 'should return correct?' do#
        expect(@turn.correct?).to eq(true)
    end

    it 'should return feedback' do
        expect(@turn.feedback).to eq('Correct!') 
    end
    

end