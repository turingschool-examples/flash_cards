require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do
    before(:each) do
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card_1, @card_2, @card_3]
        @deck = Deck.new(@cards)
    end

    it 'deck exists' do
        expect(@deck).to be_an_instance_of(Deck)
    end

    it 'contains cards' do 
        expect(@deck.cards).to eq(@cards)
    end

    it 'returns specific cards' do
        expect(@deck.count).to eq(3)
    end
    
    it 'retuns card_1' do 
        expect(@deck.cards_in_category(:STEM)).to eq(card_1)
    end


    
end