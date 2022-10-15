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

        expect(round.turns).to eq([new_turn])

    end

#Test 11
#Checks that number_correct method can share the number of correct answers in the round
    it "The number of correct guesses is 1" do

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

        round.number_correct

        expect(round.number_correct).to eq(1)

    end
#Test 12
#Checks that the current card has changed to the next one"

    it "Current card has been updated to the next one via the take turn method" do
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
        
        round.current_card

        expect(round.current_card).to eq(card_2)

    end

#Test 13
#Takes another turn and guesses venus"

    it "Take another turn and guess 'venus'" do

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

        new_turn2 = round.take_turn("Venus")

        expect(new_turn2).to be_instance_of(Turn)

    end

#Test 14
#Counts the number of turns in the round taken

    it "Counts the turns after second guess" do

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

        new_turn2 = round.take_turn("Venus")

        round.turns.count

        expect(round.turns.count).to eq(2)

    end

#Test 15
#Requests feedback method on the last turn taken

    it "Looks up feedback for last turn guess" do

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

        new_turn2 = round.take_turn("Venus")

        round.turns.last.feedback

        expect(round.turns.last.feedback).to eq("Incorrect. :(")

    end

#Test 16
#Checks the number of correct answers in the round

    it "Shows number of correct answers in the round" do

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

        new_turn2 = round.take_turn("Venus")

        round.number_correct

        expect(round.number_correct).to eq(1)

    end

#Test 17
#Checks the number of correct answers in the round by category, Geography"

    it "What are the number of correct answers in category Geography for round?" do

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

        new_turn2 = round.take_turn("Venus")

        round.number_correct_by_category(:Geography)

        expect(round.number_correct_by_category(:Geography)).to eq(1)

    end

#Test 18
#Checks the number of correct answers in the round by category, STEM"

    it "what are the number of correct answers in the round by category STEM" do

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

        new_turn2 = round.take_turn("Venus")

        round.number_correct_by_category(:STEM)

        expect(round.number_correct_by_category(:STEM)).to eq(0)

    end

#Test 19
#Checks the percentage of correct answers

    it "Shows the percentage of correct answers from the 2 turns" do

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

        new_turn2 = round.take_turn("Venus")
        require 'pry'; binding.pry

        round.percent_correct
require 'pry'; binding.pry
        expect(round.percent_correct).to eq("%50")

    end

#Test 20
#Checks the percentage of correct answers within the geography category"

#Test 21
#Checks the current card


end
