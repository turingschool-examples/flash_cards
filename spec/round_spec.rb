require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do

#Test 1
#Checks that cards 1-3 exist
    it "Cards 1 through 3 exist" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        expect(card_1).to be_instance_of(Card)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        expect(card_2).to be_instance_of(Card)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        expect(card_2).to be_instance_of(Card)

    end


#Test 2
#Checks that deck exists and has all cards in it

    it "Deck exists" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = []
        cards.push card_1, card_2, card_3

        deck = Deck.new(cards)

        expect(deck).to be_instance_of(Deck)

    end

#Test 3
#Checks that round is an instance of Round
    it "round exists with an attribute of deck" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = []
        cards.push card_1, card_2, card_3

        deck = Deck.new(cards)

        round = round.new(deck)

        expect(round)to be_instance_of(Round)
    end

#Test 4
#Checks that round.deck calls the instance deck

#Test 5
#Checks that turns is a method that pulls up a blank turn?

#Test 6
#Checks that method current card pulls up the first card we make

#Test 7
#Checks that method take turn enters a guess into a new turn

#Test 8
#Checks that new_turn is an instance of Turn class

#Test 9
#Checks that the guess for the new turn is correct

#Test 10
#Checks that the turns method can return the turn instance for the round

#Test 11
#Checks that numer correct method can share the number of correct answers in the round

#Test 12
 


end
