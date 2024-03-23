require 'spec_helper'

RSpec.describe Round do
    before(:each) do
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card_1, @card_2, @card_3]
        @deck = Deck.new(@cards)
        @round = Round.new(@deck)
    end

    describe '#initialize' do
        it 'exists' do
            expect(@round).to be_instance_of(Round)
        end

        it 'has a deck of cards' do
            expect(@round.deck).to eq(@deck)
        end

        it 'has a way to store turns' do
            expect(@round.turns).to be_empty
        end
    end

    describe '#current_card' do
        it 'can find the current card being played' do
            expect(@round.current_card).to eq(@card_1)
        end
    end

    describe '#take_turn' do
        it 'creates a new Turn object' do
            new_turn = @round.take_turn('Juneau')
            expect(new_turn).to be_instance_of(Turn)
        end

        it 'has appropiate guess' do
            new_turn = @round.take_turn('Juneau')
            expect(new_turn.guess).to eq('Juneau')
        end

        it 'has appropiate card' do
            new_turn = @round.take_turn('Juneau')
            expect(new_turn.card).to eq(@card_1)
        end 

        it 'returns true if guess is correct' do
            new_turn = @round.take_turn('Juneau')
            expect(new_turn.correct?).to be true
        end

        it 'stores each new turn' do
            new_turn = @round.take_turn('Juneau')
            expect(@round.turns).to eq([new_turn])
        end

        it 'counts number of correct answers' do
            @round.take_turn('Juneau')
            expect(@round.number_correct).to eq(1)
        end

        it 'shifts to next card in deck' do
            @round.take_turn('Juneau')
            expect(@round.current_card).to eq(@card_2)
        end

        it 'takes another turn which has incorrect guess' do
            @round.take_turn('Juneau')
            @round.take_turn('Venus')
            expect(@round.turns.count).to eq(2)
            expect(@round.turns.last.feedback).to eq('Incorrect.')
            expect(@round.number_correct).to eq(1)
        end

        it 'shifts to next card in deck' do
            @round.take_turn('Juneau')
            @round.take_turn('Venus')
            expect(@round.current_card).to eq(@card_3)
        end
    end

    describe '#number_correct_by_category' do
        it 'can count number of correct guesses for specified category' do
            @round.take_turn('Juneau')
            @round.take_turn('Venus')
            expect(@round.number_correct_by_category(:Geography)).to eq(1)
            expect(@round.number_correct_by_category(:STEM)).to eq(0)
        end
    end
end