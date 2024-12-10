require_relative '../lib/card'
require_relative '../lib/turn'
require_relative '../lib/deck'
require_relative '../lib/round'
require 'pry'


RSpec.describe Deck do
      it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
        cards = [card_1, card_2, card_3]
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
    
      it 'has cards in category' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            
            expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
      end
      it 'has cards in category' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            
            expect(deck.cards_in_category("Pop Culture")).to eq([])
      end
    end
    