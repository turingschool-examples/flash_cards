require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"

RSpec.describe Round do
    before(:example) do #code block ran before all tests
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @deck = Deck.new([@card_1, @card_2, @card_3])
        @round = Round.new(@deck)
    end

    it "exists" do
        expect(@round).to be_instance_of(Round)
    end

    it "contains a deck" do
        expect(@round.deck).to eq(@deck)
    end

    it "begins with no turns" do
        expect(@round.turns).to eq([])
    end

    it "gives the current card" do
       expect(@round.current_card).to eq(@card_1)
    end

    it "new turn is of the Turn class" do
       new_turn = @round.take_turn("Juneau")

       expect(new_turn).to be_instance_of(Turn)
    end

    it "recognizes if guess is correct" do
       new_turn = @round.take_turn("Juneau")

       expect(new_turn.correct?).to eq(true)
    end

    it "states number of correct guesses so far" do
       new_turn = @round.take_turn("Juneau")

       expect(@round.number_correct).to eq(1)
    end

    it "new turn moves on to new card" do
        new_turn = @round.take_turn("Juneau")

       expect(@round.current_card).to eq(@card_2)
    end

    it "continues turn count and provides feedback for last guess" do
        @round.take_turn("Juneau")
        @round.take_turn("Venus")
        
        expect(@round.turns.count).to eq(2)
        expect(@round.turns.last.feedback).to eq("Incorrect")
    end

    it "states total correct guesses (integer and percentage)" do
        @round.take_turn("Juneau")
        @round.take_turn("Venus")
        
        expect(@round.number_correct).to eq(1)
        expect(@round.percentage_correct).to eq(50.0)
    end

    it "states correct guesses by category (integer and percentage)" do
        @round.take_turn("Juneau")
        @round.take_turn("Venus")
        
        expect(@round.number_correct_by_category(:Geography)).to eq(1)
        expect(@round.number_correct_by_category(:STEM)).to eq(0)
        expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    end
end