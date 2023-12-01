# create test for Deck to make sure it exists as the class
# create test to return what cards are in the deck
# create test to count how many cards are in a deck
# create test to return cards based on the category they have

require 'rspec'
require './lib/card.rb'
require './lib/deck.rb'

RSpec.describe Deck do
    it 'exists' do

        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        deck = Deck.new(card)

        expect(deck).to be_a(Deck)
    end

    it 'can return what cards are in the deck' do

        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
        cards = [card1, card2, card3]

        deck = Deck.new(cards)

        expect(deck.cards).to eq(cards)
    end

    it 'can count how many cards are in a deck' do

        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
        cards = [card1, card2, card3]

        deck = Deck.new(cards)

        expect(deck.count).to eq(3)
    end

    it 'can return cards based on their category' do

        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
        cards = [card1, card2, card3]

        deck = Deck.new(cards)

        expect(deck.cards_in_category(:STEM)).to eq([card2, card3])
    end
end