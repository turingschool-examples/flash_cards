require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do

    before :each do
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        @cards = [@card_1, @card_2, @card_3]

        @deck = Deck.new(@cards)
        @turn = Turn.new("Juneau", @cards[0])
        @round = Round.new(@deck)
        @turns = []
    end

    it '1. exists' do

        expect(@round).to be_instance_of(Round)
    end

    it '2. has a deck of cards' do

        expect(@round.deck).to eq(@deck)
    end

    it '3. takes a turns' do

        expect(@round.turns).to eq([])
    end

    it '4. pull current card' do

        expect(@round.current_card).to eq(@card_1)
    end

    it '5. takes a turn' do
        new_turn = @round.take_turn("Juneau")
        @turns = [new_turn]

        expect(new_turn.class).to eq(Turn)
        expect(new_turn.correct?).to eq(true)
        expect(@round.turns).to eq(@turns)
        expect(@round.number_correct).to eq(1)
    end

    it '6. moves to the next card' do
        new_turn = @round.take_turn("Juneau")
        @turns = [new_turn]

        expect(@round.current_card).to eq(@card_2)
        expect(@round.take_turn("Venus")).to be_instance_of(Turn)
        expect(@round.turns.count).to eq(2)
        expect(@round.turns.last.feedback).to eq("Incorrect.")
        expect(@round.number_correct).to eq(1)
    end

    it '7. records correct answers by category and percentage' do
        new_turn = @round.take_turn("Juneau")
        new_turn = @round.take_turn("Venus")
        @turns = [new_turn]

        expect(@round.number_correct_by_category(:Geography)).to eq(1)
        expect(@round.number_correct_by_category(:STEM)).to eq(0)
        expect(@round.percent_correct).to eq(50.0)
        expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
        # expect(@round.current_card).to eq(@card_3)
    end
end