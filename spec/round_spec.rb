require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do

    before(:each) do

        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card_1, @card_2, @card_3]
        @deck = Deck.new(@cards)
        @round = Round.new(@deck)

    end

    it 'exists' do        
        expect(@round).to be_instance_of(Round)
    end

    it 'loads the deck into the round' do
        expect(@round.deck).to eq(@deck)
    end

    it 'starts the turn with an empty turns array' do
        expect(@round.turns).to eq([])
    end

    it 'pulls the current card in the deck' do
        expect(@round.current_card).to eq(@card_1)
    end

    it 'logs each new turn into the turns array' do
        new_turn = @round.take_turn("Juneau") 

        expect(@round.turns.last).to eq(new_turn)
    end

    it 'add correct answers to the number correct counter' do
        new_turn = @round.take_turn("Juneau") 

        expect(@round.number_correct).to eq(1)
    end

    it  'identifies the percent of correct answers per round' do
        new_turn = @round.take_turn("Juneau") 

        expect(@round.percent_correct).to eq(100) 
    end

    it 'identifies the number of correct answers in the round by category' do
        new_turn = @round.take_turn("Juneau") 

        expect(@round.number_correct_by_category(:Geography)).to eq(1) 
    end
    
    it 'calculates the percent of correct answers in the round by category' do
        new_turn = @round.take_turn("Juneau") 

        expect(@round.percent_correct_by_category(:Geography)).to eq(100)
    end

    it 'identifies each unique category in the round' do
        new_turn = @round.take_turn("Juneau") 

        expect(@round.deck.cards.map(&:category).uniq).to eq([:Geography, :STEM])
    end
end