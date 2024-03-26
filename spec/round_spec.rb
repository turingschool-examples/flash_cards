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

    it "checks if new_turn is a Turn class" do
        new_turn = @round.take_turn("Juneau")

        expect(new_turn.class).to eq(Turn)
    end

    it "checks if guess if correct this round" do
        new_turn = @round.take_turn("Juneau")

        expect(new_turn.correct?).to be(true)
    end

    it "checks if guess if incorrect this round" do
        new_turn = @round.take_turn("Madison")

        expect(new_turn.correct?).to be(false)
    end

    # comeback to don't know how to format test expectation
    it "checks the turns taken" do
        expect(@round.turns).to eq([])

        new_turn = @round.take_turn("Juneau")

        expect(@round.turns).to eq(@round.turns)        
    end

    it "can check if number of correct in round" do
        new_turn = @round.take_turn("Juneau")

        expect(@round.number_correct).to eq(1)
    end

    it "Rotates cards to next card" do
        new_turn = @round.take_turn("Juneau")

        expect(@round.current_card).to eq(@card_2)
    end

    it "can check how many turns were taken" do
        new_turn = @round.take_turn("Juneau")
        new_turn = @round.take_turn("Venus")

        expect(@round.turns.count).to eq(2)
    end

    it "can check feedback of last turn" do
        new_turn = @round.take_turn("Juneau")
        new_turn = @round.take_turn("Venus")

        expect(@round.turns.last.feedback).to eq("Incorrect.")
    end

    it "can check number correct with an one incorrect and one correct" do
        new_turn = @round.take_turn("Juneau")
        new_turn = @round.take_turn("Venus")

        expect(@round.number_correct).to eq(1)
    end

    it "can check number correct" do
        new_turn = @round.take_turn("Juneau")
        new_turn = @round.take_turn("Venus")

        expect(@round.number_correct).to eq(1)
    end

    it "can tell you percent correct" do
        new_turn = @round.take_turn("Juneau")
        new_turn = @round.take_turn("Venus")

        expect(@round.percent_correct).to eq(50.0)
    end

    it "can tell you percent correct by category" do
        new_turn = @round.take_turn("Juneau")
        new_turn = @round.take_turn("Venus")

        expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    end

    it "checks new current card after mulitple turns" do
        new_turn = @round.take_turn("Juneau")
        new_turn = @round.take_turn("Venus")

        expect(@round.current_card).to eq(@card_3)
    end
end