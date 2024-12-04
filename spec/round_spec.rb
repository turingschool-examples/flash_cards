require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do 
    before(:each) do 
        @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card1, @card2, @card3]
        @deck = Deck.new(@cards) 
        @round = Round.new(@deck)
    end

    it 'exists' do
        expect(@round).to be_a(Round)
    end

    it 'checks for the current card at the front of the array' do
        expect(@round.current_card).to eq(@card1)
    end

    it 'creates and records a new turn for the round' do 
        new_turn = @round.take_turn("Juneau")

        expect(new_turn.class).to eq(Turn)
        expect(new_turn.correct?).to eq(true)
    end

    it 'counts the amount of turns taken' do 
        expect(@round.turn_count).to eq(0)
        
        new_turn = @round.take_turn("Juneau")
        new_turn = @round.take_turn("Venus")

        expect(@round.turns.count).to eq(2)
    end

    it 'records the number of correct answers in the turns array' do
        new_turn = @round.take_turn("Juneau")
        expect(@round.number_correct).to eq(1)

        new_turn = @round.take_turn("Venus")
        expect(@round.number_correct).to eq(1)
    end

    it 'determines the last turn taken' do
        turn1 = @round.take_turn("Juneau")
        turn2 = @round.take_turn("Venus")

        expect(@round.last_turn).to eq(turn2)
        expect(@round.last_turn.guess).to eq("Venus")
        expect(@round.last_turn.feedback).to eq("Incorrect.")
    end
end