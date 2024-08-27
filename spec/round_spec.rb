require 'pry';binding.pry
require './lib/deck'
require './lib/turn'
require './lib/card'
require './lib/round'

RSpec.describe Round do
    before(:each) do
        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card1, card2, card3]
        @deck = Deck.new(cards)
        @round = Round.new(@deck)
    end
    it 'exists' do
        expect(@round).to be_instance_of(Round)
        expect(@round.deck).to eq(@deck)
    end

    it 'current card' do
        expect(@round.current_card).to eq(@deck.cards.first)

    end

    it "stores turns" do 
        expect(@round.turns).to eq([])
    end

    it "counts correct turns" do
        @round.take_turn("Juneau")
        expect(@round.number_correct).to eq(1)
    end

    it "counts correct turns in category" do
        @round.take_turn("Juneau")
        expect(@round.number_correct_by_category(:Geography)).to eq(1)
    end

    it "counts percent of turns correct" do
        @round.take_turn("juneau")
        expect(@round.percent_correct).to eq(100.0)


    end 
    it "percent correct by category" do
        @round.take_turn("juneau")
        expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    end

end