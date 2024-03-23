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
        @round = Round.new(@deck)
    end

    it "is an instance of Round" do
        expect(@round).to be_instance_of(Round)
    end

    it "has a deck" do
        expect(@round.deck).to be_instance_of(Deck)
    end

    it "has turns" do
        expect(@round.turns).to eql([])
    end

    it "has can shows the current card" do
        expect(@round.current_card).to eq(@card_1)
    end

    # comeback to don't know how to format test expectation
    # it "can create a turn" do
    #     expect(@round.take_turn("Juneau")).to eq(new_turn)
    # end

    it "checks if new_turn is a Turn class" do
        new_turn = @round.take_turn("Juneau")

        expect(new_turn.class).to eq(Turn)
    end

    it "checks if guess if correct this round" do
        new_turn = @round.take_turn("Juneau")

        expect(new_turn.correct?).to be(true)
    end


end