require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.configure do |config|
    config.formatter=:documentation
end

RSpec.describe Round do
    before(:each) do
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @deck = Deck.new([@card_1, @card_2, @card_3])
        @round = Round.new(@deck)
    end

    it 'initializes deck and makes the first card current_card' do
        expect(@round.deck).to eq(@deck)
        expect(@round.turns).to eq([])
        expect(@round.current_card).to eq(@card_1)
    end

    it 'records guesses and moves to the next card' do
        new_turn = @round.take_turn('Juneau')

        expect(new_turn.class).to eq(Turn)
        expect(new_turn.correct?).to be true
        expect(@round.turns).to eq([new_turn])
        expect(@round.number_correct).to eq(1)
        expect(@round.current_card).to eq(@card_2)
    end

    it 'takes another turn and updates the round correctly' do
        @round.take_turn("Juneau")
        new_turn = @round.take_turn("Venus")

        expect(@round.turns.count).to eq(2)
        expect(@round.turns.last.feedback).to eq("Incorrect.")
        expect(@round.number_correct).to eq(1)
        expect(@round.number_correct_by_category(:Geography)).to eq(1)
        expect(@round.number_correct_by_category(:STEM)).to eq(0)
        expect(@round.percent_correct).to eq(50.0)
        expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    end
end