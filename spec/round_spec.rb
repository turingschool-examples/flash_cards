require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
    before(:each) do
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @deck = Deck.new[@card_1, @card_2, @card_3]
        round = Round.new(@deck)
    end

    it 'initializes deck and makes the first card current_card' do
        expect(@round.deck).to eq(@deck)
        expect(@round.turns).to eq([])
        expect(@round.current_card).to eq(@card_1)
    end

    it 'records guesses and moves to the next card' do
        turn_1 = @round.take_turn('Juneau')
        expect(turn_1).to be_instance_of(Turn)
        expect(turn_1.correct?)to be true
        expect(@round.turns.count).to eq(1)
        expect(@round.turns.last).to eq(turn_1)
        expect(@round.current_card).to eq(@card_2)

        turn_2 = @round.take_turn("Venus")
        expect(turn_2).to be_instance_of(Turn)
        expect(turn_2.correct?)to be false
        expect(@round.turns.count).to eq(2)
        expect(@round.turns.last).to eq(turn_2)
        expect(@round.current_card).to eq(@card_3)
    end


end