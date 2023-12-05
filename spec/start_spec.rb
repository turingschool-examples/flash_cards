require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/start.rb'
require 'pry'

RSpec.describe do
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new([card_1, card_2, card_3])

        round = Round.new(deck)

        start = Start.new(round)

        expect(start).to be_a(Start)
    end

    it 'can have a round' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new([card_1, card_2, card_3])

        round = Round.new(deck)

        start = Start.new(round)
        
        expect(start.round).to eq(round)
    end

    it 'can give the start message of the game' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new([card_1, card_2, card_3])

        round = Round.new(deck)

        start = Start.new(round)

        expect(start.start_game_message).to eq("Welcome! You're playing with 3 cards.\n-------------------------------------------")
    end

    #struggling to figure out how to test this method in a meaningful way

    xit 'can play through the rounds' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new([card_1, card_2, card_3])

        round = Round.new(deck)

        start = Start.new(round)

        expect(start.game_rounds).to eq("This is card number 1 out of 3.")
    end

    it 'can select unique categories' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new([card_1, card_2, card_3])

        round = Round.new(deck)

        start = Start.new(round)

        expect(start.category_selector).to eq([:Geography, :STEM])
    end

    xit 'can read the game over message' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new([card_1, card_2, card_3])

        round = Round.new(deck)

        start = Start.new(round)

        expect(start.game_over_message).to eq("****** Game over! ******\nYou had 0 correct guesses out of 3 for a total score of 0.0%.\n:Geography - 0.0% correct\n:STEM - 0.0% correct")
    end
end