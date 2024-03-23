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
end