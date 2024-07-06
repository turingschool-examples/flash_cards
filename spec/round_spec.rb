require './lib/round'
require './lib/turn'
require './lib/deck'
require './lib/card'

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

    it 'has deck' do
        expect(@round.deck).to eq(@deck)
    end

    it 'has cards in deck' do
        expect(@deck.cards).to eq([@card_1, @card_2, @card_3])
    end

    

end