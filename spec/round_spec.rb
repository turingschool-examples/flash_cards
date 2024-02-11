# Header Files
require 'rspec'
require 'pry'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/turn.rb'

# Feedback Fomatting
RSpec.configure do |config|
    config.formatter = :documentation
end

# Tested Class
RSpec.describe Round do

    # Exists
    it "exists" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round).to be_a (Round)
    end

    # Lists the deck object used in the round
    it "lists the deck object used in the round" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round.deck).to eq (deck)
    end

    # Displays empty array for current turns at beginning
    it "displays empty array for current turns at beginning" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round.turns).to eq ([])
    end

    # Displays the current card
    it "displays the current card" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.current_card).to eq (card_1)
    end

    # New turn creates a new turn object
    it "new turn creates a new turn object" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        new_turn = round.take_turn("Juneau")

        expect(new_turn).to be_a (Turn)
    end

    # New turn class identifies correctly
    it "new turn class identifies correctly" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        new_turn = round.take_turn("Juneau")

        expect(new_turn.class).to eq (Turn)
    end

    # User guess returns appropriately
    it "user guess returns appropriately if correct" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        new_turn = round.take_turn("Juneau")

        expect(new_turn.correct?).to eq (true)
    end

    # Updates turns array with guess
    it "updates turns array with guess" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        new_turn = round.take_turn("Juneau")

        expect(round.turns).to eq ([new_turn]) 
    end

    # Updates if the number is correct
    it "updates if the number is correct" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round.number_correct).to eq (0)

        guess = ("Juneau")
        round.take_turn(guess)

        expect(round.number_correct).to eq (1) 
    end

    # Updates with current card answer
    it "updates with the current card" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        
        expect(round.current_card.answer).to eq ("Juneau")

        guess = ("Juneau")
        round.take_turn(guess)

        expect(round.current_card.answer).to eq ("Mars")
    end

        # Updates number correct by category
        it "updates number correct by category" do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)

            expect(round.number_correct_by_category(:STEM)).to eq (0)

            guess = ("Juneau")
            round.take_turn(guess)

            expect(round.number_correct_by_category(:STEM)).to eq (0)

            guess = ("Mars")
            round.take_turn(guess)

            expect(round.number_correct_by_category(:STEM)).to eq (1)

            guess = ("North north west")
            round.take_turn(guess)

            expect(round.number_correct_by_category(:STEM)).to eq (2)
        end

        # Updates percent correct
        it "updates percent correct" do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)

            guess = ("Juneau")
            round.take_turn(guess)

            expect(round.percent_correct).to eq (100.0)

            guess = ("Venus")
            round.take_turn(guess)

            expect(round.percent_correct).to eq (50.0)

            guess = ("North north west")
            round.take_turn(guess)

            expect(round.percent_correct).to eq (66.7)
        end

        # Updates percent correct by category
        it "updates percent correct by category" do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)

            guess = ("Juneau")
            round.take_turn(guess)

            expect(round.percent_correct_by_category(:STEM)).to eq (0)

            guess = ("Venus")
            round.take_turn(guess)

            expect(round.percent_correct_by_category(:STEM)).to eq (0)

            guess = ("North north west")
            round.take_turn(guess)

            expect(round.percent_correct_by_category(:STEM)).to eq (50.0)
        end

end