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

        round = Round.new(deck)

        expect(round).to be_instance_of(Round)

    end

#Test 4
#Checks that round.active_deck calls the instance deck
    it "deck exists within round" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = []
        cards.push card_1, card_2, card_3

        deck = Deck.new(cards)

        round = Round.new(deck)

        expect(round.active_deck).to eq(deck)

    end


#Test 5
#Checks that round has an attribute, turns with an empty array
    it "round has attribute turns that is an empty array" do

        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = []
        cards.push card_1, card_2, card_3

        deck = Deck.new(cards)

        round = Round.new(deck)

        round.turns

        expect(round.turns).to eq([])

    end

#Test 6
#Checks that method current card pulls up the first card we make
    it "The current card is card_1" do
        
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = []
        cards.push card_1, card_2, card_3

        deck = Deck.new(cards)

        round = Round.new(deck)

        round.turns

        round.current_card
        
        expect(round.current_card).to eq(card_1)

    end

#Test 7
#Checks that method take turn enters a guess into a new turn
    it "create an instance of Turn called 'new_turn' and have the guess be 'Juneau'" do

        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = []
        cards.push card_1, card_2, card_3

        deck = Deck.new(cards)

        round = Round.new(deck)

        round.turns

        round.current_card

        new_turn = round.take_turn("Juneau")

        expect(new_turn).to be_instance_of(Turn)

    end

#Test 8
#Checks that new_turn is an instance of Turn class with the class method

    it "new_turn.class returns Turn" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = []
        cards.push card_1, card_2, card_3

        deck = Deck.new(cards)

        round = Round.new(deck)

        round.turns

        round.current_card

        new_turn = round.take_turn("Juneau")

        new_turn.class

        expect(new_turn.class).to eq(Turn)

    end

#Test 9
#Checks that the guess for the new turn is correct

    it "The guess in new_turn is correct" do

        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = []
        cards.push card_1, card_2, card_3

        deck = Deck.new(cards)

        round = Round.new(deck)

        round.turns

        round.current_card

        new_turn = round.take_turn("Juneau")

        new_turn.correct?

        expect(new_turn.correct?).to eq(true)

    end

#Test 10
#Checks that the turns method can contains the turns taken

    it "When a new turn is made the turn also needs to be added in the round's @turns" do

        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = []
        cards.push card_1, card_2, card_3

        deck = Deck.new(cards)

        round = Round.new(deck)

        round.turns

        round.current_card

        new_turn = round.take_turn("Juneau")

        round.turns

        expect(round.turns).to eq(turns)

    end

#Test 11
#Checks that numer correct method can share the number of correct answers in the round

#Test 12
 


end
