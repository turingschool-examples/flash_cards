require 'pry'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do 
    before(:each) do
        @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card1, @card2, @card3]
        @deck1 = Deck.new(@cards) 
    end

    it 'exists' do
        expect(@deck1).to be_a(Deck)
    end

    it 'holds a collection of cards' do
        expect(@deck1.cards).to eq([@card1, @card2, @card3]) 
    end 

    it 'checks what category a card belongs to' do 
        expect(@deck1.cards_in_category(:STEM)).to eq([@card2, @card3])
    end

    it 'counts how many cards are in the deck' do
        expect(@deck1.card_count).to eq(3)
    end 
end