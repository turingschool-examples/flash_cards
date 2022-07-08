require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turns do

    before do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turns.new("Juneau", @card, '')
    @guess = Turns.new("Juneau", @card, 'Juneau')
    end

    it 'class should exist' do
        expect(@turn).to be_instance_of Turns
    end

    it 'should return guess' do
        expect(@guess).to eq('Juneau') 
    end

    xit 'should return card' do
        expect(@turn.card).to eq(card) 
    end

    xit 'should return correct?' do
        expect(@turn.correct?).to eq(card) 
    end

    xit 'should return feedback' do
        expect(@turn.feedback).to eq(card) 
    end
    
end