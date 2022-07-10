require './lib/deck'
require './lib/turn'
require './lib/card'
#require 'pry'; binding.pry


RSpec.describe Deck do
    
    before do 
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card_1, @card_2, @card_3]
    end


    it 'deck exists' do
        deck = Deck.new(@cards)
        deck.cards
        
        expect(deck).to be_instance_of(Deck)
    end

    it 'deck card array' do
        deck = Deck.new(@cards)

        expect(deck.cards).to eq(@cards)

    end

    it 'deck count' do
        deck = Deck.new(@cards)

        expect(deck.count).to eq(3)
    end

    it 'return cards in same category' do
        deck = Deck.new(@cards)
        
        expect(deck.cards_in_category(:STEM)).to match_array([@card_2, @card_3])
        expect(deck.cards_in_category(:Geography)).to eq([@card_1])
        expect(deck.cards_in_category(:"Pop Culture")).to eq([])
    end

end