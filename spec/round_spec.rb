require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Deck do
    before (:all) do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        @cards = [card_1, card_2, card_3]
        @deck = Deck.new(@cards)
        @round = Round.new(@deck)
    end

    it 'exists' do
        expect(@round).to be_instance_of(Round)
    end

    it 'can show the deck of cards within' do
        expect(@round.deck).to eq(@deck)
    end

    it 'returns an empty array for start of round turns' do
        expect(@round.turns).to eq []
    end

    it 'shows the current card' do
        expect(@round.current_card).to be_instance_of(Card)
        expect(@round.current_card).to eq(@deck.cards[0])
    end

    describe 'the turns' do
        before (:all) do
            @new_turn = @round.take_turn("Juneau")
        end

        it 'can take turns' do
            expect(@new_turn).to eq(@round.turns)
        end

        it 'can track if answer is correct' do
            expect(@new_turn[0].correct?).to eq true
        end 

        it 'adds the turn to the turns array' do
            expect(@new_turn).to eq(@round.turns)
        end

        it 'tracks number of correct answers' do
            expect(@round.number_correct).to eq 1
        end

        it 'updates current card to the next available' do
            expect(@round.current_card).to eq(@round.deck.cards[1])
        end

        describe 'data available after two rounds' do
            before (:all) do
                @round.take_turn("Venus")
            end

            xit 'plays second round' do
                expect(@round.turns.count).to eq 2
            end
            
            xit 'reveals feedback for second round' do
                expect(@round.turns.last.feedback).to eq "Incorrect"
            end

            xit 'tracks number correct and percentage' do
                expect(@round.number_correct).to eq 1
                expect(@round.percent_correct).to eq 50.0
            end

            xit 'tracks number correct by category and percentage by category' do
                expect(@round.number_correct_by_category(:Geography)).to eq 1
                expect(@round.number_correct_by_category(:STEM)).to eq 0
                expect(@round.percent_correct_by_category(:Geography)).to eq 100.0
            end

            xit 'shows last card in deck' do
                expect(@round.current_card).to eq(@cards[2])
            end
        end
    end

end
