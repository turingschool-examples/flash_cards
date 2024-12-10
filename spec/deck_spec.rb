# deck_spec.rb - run RSpec based tests on Deck class

require './lib/card.rb'
require './lib/deck.rb'
require 'rspec'

describe Deck do
    # This allows me to not have to re-create this each time.  Admittedly, not much faster than copy/paste, but fun different thing to try!
    before(:each) do
        @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
        @deck = Deck.new([@card1, @card2, @card3])
    end

    it 'deck exists' do
        expect(@deck).to be_a(Deck)
    end

    it 'has correct cards' do
        expect(@deck.cards).to eq([@card1, @card2, @card3])
    end

    it 'count number of cards' do
        expect(@deck.count).to eq(3)
    end

    it 'count cards in specific category' do
        expect(@deck.cards_in_category(:STEM)).to eq([@card2, @card3])
    end

end