require './lib/card'
require './lib/deck.rb'

RSpec.describe Deck do

#Test 1
#Card 1 -3 all exist
    it "Cards 1 through 3 exist" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        expect(card_1).to be_instance_of(Card)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        expect(card_2).to be_instance_of(Card)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        expect(card_2).to be_instance_of(Card)

    end

#Test 2
#Array cards with card 1-3 exists
    it "Array, 'cards' exists" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    
        cards = []
        cards.push card_1, card_2, card_3

        expect(cards).to include(card_1, card_2, card_3)
    
    end

#Test 3
#Deck, cards exists
    it "Deck exists" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    
        cards = []
        cards.push card_1, card_2, card_3

        deck = Deck.new(cards)

        expect(deck).to be_instance_of(Deck)
    end






#Test 4
#Can call on cards

#Test 5
#Can count the number of cards in deck

#Test 6
#Can call the cards in category :STEM

#Test 7
#Can call the cards in category :Geography

#Test 8
#Can call the cards in category "Pop Culture"

end