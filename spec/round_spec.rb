require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.configure do |config|
    config.formatter = :documentation
    end

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

    it 'has a deck of cards' do

        expect(@round.deck).to eq(@deck)
    end
    
    it 'prints an empty array at the start' do

        expect(@round.turns).to eq []
    end

    it 'draws the current card' do

        expect(@round.current_card).to be_a(Card)
        expect(@round.current_card).to eq(@deck.cards[0])
    end

    it 'it can start a new turn' do
        
        expect(@round.take_turn).to be(Card(guess))
    end

end