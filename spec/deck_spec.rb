require 'rspec'
require './lib/deck'
require './lib/card'


describe Deck do 
    describe '#initialize' do 
        it 'is an instance of deck' do 
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
            and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° 
            clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            expect(deck).to be_instance_of(Deck)
        end 
       

        it 'holds an array of cards' do 
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
            and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° 
            clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
       
            expect(deck.cards).to eq(cards)
        end 

        it 'counts the number of cards' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
            and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° 
            clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            expect(deck.count).to eq(3)
        end 

        it'counts the number of cards per category' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
            and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° 
            clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            require 'pry'; binding.pry
            expect(deck.cards_in_category(:STEM)).to eq(2)

        end
    end 
end 