require 'rspec'
require './lib/turn'
require './lib/card'
require './lib/deck'

describe Deck do
    describe '#initialize' do
        it 'is an instance of deck' do
            cards = []
            deck = Deck.new(cards)
            expect(deck).to be_instance_of(Deck)
        end
        it 'has cards' do
        
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            expect(deck.cards).to eq(cards)
        end
    end

    describe '#count' do
        it 'counts differnt amounts of cards in decks' do

            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            card_4 = Card.new("test", "test", :test)
            
            cards_1 = [card_1, card_2, card_3]
            cards_2 = [card_1, card_2, card_3, card_3]
            deck_1 = Deck.new(cards_1)
            deck_2 = Deck.new(cards_2)

            expect(deck_1.count).to eq(3)
            expect(deck_2.count).to eq(4)
        end 
    end
    
    describe '#cards_in_category' do
        it 'filters cards based on category' do
        
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3] 
            deck = Deck.new(cards)
            
            expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
        end
    end
end