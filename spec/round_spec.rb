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

        # expect(@round.current_card).to be_a(card_index)
        expect(@round.current_card).to eq(@deck.cards[0])
    end

    it 'it can start a new turn' do

        new_turn = @round.take_turn("Juneau")
        expect(new_turn.guess).to eq("Juneau")
        expect(new_turn.card).to eq(@card_1)

        new_turn = @round.take_turn("Mars")
        expect(new_turn.guess).to eq("Mars")
        expect(new_turn.card).to eq(@card_2)

        new_turn = @round.take_turn("North north west")
        expect(new_turn.guess).to eq("North north west")
        expect(new_turn.card).to eq(@card_3)
    end

    it 'keeps track of correct answers' do

        new_turn = @round.take_turn("Juneau")
        expect(@round.number_correct).to eq 1
    end

    it 'keeps track of number correct by category' do

        new_turn = @round.take_turn("Juneau")
        new_turn = @round.take_turn("Venus")
        expect(@round.number_correct_by_category(:Geography)).to eq 1
        expect(@round.number_correct_by_category(:STEM)).to eq 0     
    end

    it 'tracks the percent correct' do

        new_turn = @round.take_turn("Juneau")
        new_turn = @round.take_turn("Venus")
        expect(@round.percent_correct).to eq 50.0
    end

    it 'keeps track of percent correct by category' do

        new_turn = @round.take_turn("Juneau")
        new_turn = @round.take_turn("Venus")

        expect(@round.percent_correct_by_category(:Geography)).to eq 100.0
    end
end