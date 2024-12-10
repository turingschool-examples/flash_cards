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
        expect(@round).to be_a(Round)
    end

    it 'selects the first card in deck for each turn' do
        expect(@round.current_card).to eq(@card_1)
        @round.take_turn("Mars")
        expect(@round.current_card).to eq(@card_2)
        @round.take_turn("North north west")
        expect(@round.current_card).to eq(@card_3)
    end

    it 'creates and records a new turn for the round' do
        @round.take_turn("Juneau")
        @round.take_turn("Mars")
        @round.take_turn("North north west")

    end

    # it 'can check for correctness' do


    # end

    it 'return number correct by category' do
        @round.take_turn("Juneau")
        @round.take_turn("Mars")
        @round.take_turn("North north west")
        

        expect(@round.number_correct_by_category(:Geography)).to eq(1)
        # expect(@round.number_correct_by_category(:STEM)).to eq(1)
        expect(@round.number_correct_by_category(:STEM)).to eq(2)
    end     

    it 'returns current percentage of correct answers by category' do
        @round.take_turn("Juneau")
        @round.take_turn("Mars")
        @round.take_turn("North north west")

        expect(@round.percent_correct_by_category(:Geography)).to eq(100.00)
        expect(@round.percent_correct_by_category(:STEM)).to eq(100.00)
        expect(@round.percent_correct_by_category(:STEM)).to eq(100.00)
    end

    it 'will calculate percent correct' do
        @round.take_turn("Juneau")
        @round.take_turn("Mars")
        @round.take_turn("North north west")

        expect(@round.percent_correct).to eq(100.00)
    end
end