require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

RSpec.describe Round do

    before(:each) do

        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card_1, @card_2, @card_3]
        @deck = Deck.new(@cards)
        @turn = Turn.new("Juneau", @card_1)
        @round = Round.new(@deck)

    end

    it 'exists' do        
        expect(@round).to be_instance_of(Round)
    end

    it 'loads_deck_into_round' do
        expect(@round.deck).to eq(@deck)
    end

    it 'starts_turns' do
        expect(@round.turns).to eq([])
    end

    it 'pulls_current_card' do
        expect(@round.current_card).to eq(@card_1)
    end

    it 'starts_with_empty_turns_array' do
        expect(@round.turns).to eq([])
    end

    it 'takes_turns' do
        new_turn = Turn.new("Juneau", @card_1)

        expect(@round.take_turn("Juneau")).to eq(@turn)
        expect(new_turn.correct?).to eq(true)
        expect(@round.number_correct).to eq(1)
        expect(@round.number_correct_by_category(:Geography)).to eq(1)
        expect(@round.percent_correct).to eq(100)
        expect(@round.percent_correct_by_category(:Geography)).to eq(50)
    end
end