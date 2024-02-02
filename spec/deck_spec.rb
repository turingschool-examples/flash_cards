require './lib/card'
require './lib/deck'
require 'rspec'

RSpec.configure do |config|
	config.formatter = :documentation
end

RSpec.describe Deck do
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        expect(deck).to be_instance_of(Deck)
    end

    it 'is an array' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    
        cards = [card_1, card_2, card_3]  
        
        deck = Deck.new(cards)
    
        expect(deck.cards).to be_an(Array)
    end

    it 'returns how many cards there are' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]  

        deck = Deck.new(cards)

        expect(cards.count).to eq(3)
    end

    it 'returns cards from a specific category' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]  

        deck = Deck.new(cards)

        stem_cards = deck.cards_in_category(:STEM)
        geography_cards = deck.cards_in_category(:Geography)

        expect(stem_cards).to eq([card_2, card_3])
        expect(geography_cards).to eq([card_1])
    end
end