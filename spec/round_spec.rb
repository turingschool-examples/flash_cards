require './lib/deck'
require './lib/turn'
require './lib/round'

RSpec.describe Round do

    before(:each) do
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @deck = Deck.new([@card_1, @card_2, @card_3])
        @round = Round.new(@deck)
    end

    it 'exists' do
        expect(@round).to be_instance_of(Round)
    end

    it 'contains a deck' do
        expect(@round.deck).to be_instance_of(Deck)
    end

    it 'contains an array of turns that is empty by default' do
        expect(@round.turns).to eq([])
    end

    it 'contains a current card that defaults to the first in the deck' do
        expect(@round.current_card).to eq(@card_1)
    end

    it 'can take a turn and returns a Turn instance' do
        new_turn = @round.take_turn("Juneau")

        expect(new_turn).to be_instance_of(Turn)
        expect(new_turn.correct?).to be true
        expect(@round.turns).to eq([new_turn])
    end

    it 'can track the number of correct answers' do
        @round.take_turn("Juneau")
        expect(@round.number_correct).to eq(1)
    end

    it 'can flip to the next card after a turn' do
        @round.take_turn("Juneau")
        expect(@round.current_card).to eq(@card_2)
    end

    it 'can take another turn with an incorrect guess' do
        @round.take_turn("Juneau")
        @round.take_turn("Venus")

        expect(@round.turns.length).to eq(2)
        expect(@round.number_correct).to eq(1)
        expect(@round.current_card).to eq(@card_3)
        expect(@round.turns.last.feedback).to eq("Incorrect.")
    end

    it 'can track number of correct by category' do
        @round.take_turn("Juneau")
        @round.take_turn("Venus")
        
        expect(@round.number_correct_by_category(:Geography)).to eq(1)
        expect(@round.number_correct_by_category(:STEM)).to eq(0)
    end

    it 'can track percent correct' do
        @round.take_turn("Juneau")
        @round.take_turn("Venus")

        expect(@round.percent_correct).to eq(50.0)
    end

    it 'can track percent correct by category' do
        @round.take_turn("Juneau")
        @round.take_turn("Venus")

        expect(@round.percent_correct_by_cateogry).to eq(100.0)
    end

    




end




