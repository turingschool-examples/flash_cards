require './lib/card'
require './lib/deck'

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
#Deck exists
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
    it "Can call on the cards in deck" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    
        cards_1 = []
        cards_1.push card_1, card_2, card_3

        deck = Deck.new(cards_1)

        deck.cards

        expect(deck.cards).to equal cards_1
        
    end

#Test 5
#Can count the number of cards in deck
    it "Number of cards in deck is 3" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    
        cards_1 = []
        cards_1.push card_1, card_2, card_3

        deck = Deck.new(cards_1)

        deck.count

        expect(deck.count).to equal(3)

    end

#Test 6
#Can call the cards in category :STEM
    it "Can call cards of :STEM category" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    
        cards_1 = []
        cards_1.push card_1, card_2, card_3

        deck = Deck.new(cards_1)


        deck.cards_in_category(:STEM)
      
        expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])

    end

#Test 7
#Can call the cards in category :Geography
    it "can call the cards with category :Geography" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    
        cards_1 = []
        cards_1.push card_1, card_2, card_3

        deck = Deck.new(cards_1)


        deck.cards_in_category(:Geography)
      
        expect(deck.cards_in_category(:Geography)).to eq([card_1])

    end

#Test 8
#Can call the cards in category "Pop Culture"
    it "Can return an empty array when calling cards with category 'Pop Culture'" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    
        cards_1 = []
        cards_1.push card_1, card_2, card_3

        deck = Deck.new(cards_1)


        deck.cards_in_category("Pop Culture")
        expect(deck.cards_in_category("Pop Culture")).to eq([])

    end

end