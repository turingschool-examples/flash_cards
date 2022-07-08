require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turns do

    before :each do
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @turn = Turn.new("string", 'card', 'Juneau')
    end

    it 'class should exist' do
        expect(@turn).to be_instance_of Turn
    end

    it 'should return string' do #wrong
        expect(@turn.string).to eq('string') 
    end

    it 'should return guess' do #wrong
        expect(@turn.guess).to eq('guess') 
    end

    it 'should return card' do
        expect(@turn.card).to eq('card') 
    end

    xit 'should return correct?' do
        expect(@turn.correct?).to eq() 
    end

    xit 'should return feedback' do
        expect(@turn.feedback).to eq(card) 
    end
    
end