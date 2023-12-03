require "./lib/round"
require "./lib/deck"
require "./lib/turn"
require "./lib/card"

RSpec.describe Turn do
    before(:each) do
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @turn = Turn.new("Juneau", @card)
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [card_1, card_2, card_3]
        @deck = Deck.new(@cards) 
    end 

    it "exists" do 
        round = Round.new(@deck) 

        expect(round).to be_instance_of(Round)
    end 

    it "has a turn" do 
        round = Round.new(@deck)

        expect(round.turns).to eq []
    end 

    it "has a current card" do 
        round = Round.new(@deck)

        expect(round.current_card).to eq @cards[0]
    end 

    it "takes turn" do 
        round = Round.new(@deck)
        new_turn = round.take_turn("Juneau")

        expect(new_turn).to be_instance_of(Turn) 
    end 

    it "is correct" do
    round = Round.new(@deck)
    new_turn = round.take_turn("Juneau")

    expect(new_turn.correct?).to eq true 
    end

    it "number count correct guesses" do
        round = Round.new(@deck)
        new_turn = round.take_turn("Juneau")

        expect(round.number_correct).to eq 1

        new_turn = round.take_turn("Mars")

        expect(round.number_correct).to eq 2

        new_turn = round.take_turn("Wrong answer")
    
        expect(round.number_correct).to eq 2
    end 

    it "Counts turns" do 
        round = Round.new(@deck)
        new_turn = round.take_turn("Juneau")
       
        expect(round.turns.count).to eq 1 

        new_turn = round.take_turn("Venus")

        expect(round.turns.count).to eq 2 

        new_turn = round.take_turn("Wrong answer")

        expect(round.turns.count).to eq 3
    end 

    it "continues to next card" do 
        round = Round.new(@deck)
        new_turn = round.take_turn("Juneau")
        
        expect(round.current_card).to eq @cards[1]
    end

    it "counts correct by category" do 
        round = Round.new(@deck) 
        new_turn = round.take_turn("Juneau")

        expect(round.number_correct_by_category(:Geography)).to eq 1
        
        round = Round.new(@deck) 
        new_turn = round.take_turn("Juneau")
        
        expect(round.number_correct_by_category(:Stem)).to eq 0
    end

    it "counts number of turns by category" do 
        round = Round.new(@deck) 
        new_turn = round.take_turn("Juneau")

        expect(round.num_turns_by_category(:Geography)).to eq 1 

        new_turn = round.take_turn("Mars")

        expect(round.num_turns_by_category(:STEM)).to eq 1

        new_turn = round.take_turn("Wrong answer")
        
        expect(round.num_turns_by_category(:STEM)).to eq 2
    end 

    it "gives correct percent" do 
        round = Round.new(@deck) 
        new_turn = round.take_turn("Juneau")

        expect(round.percent_correct).to eq 100
    end 

    it "gives percent correct by category" do 
        round = Round.new(@deck) 
        new_turn = round.take_turn("Juneau") 

        expect(round.percent_correct_by_category(:Geography)).to eq 100

        new_turn = round.take_turn("Mars")
        
        expect(round.percent_correct_by_category(:STEM)).to eq 100 
    end 

    it "provides feedback" do 
        round = Round.new(@deck) 
        new_turn = round.take_turn("Juneau")

        expect(round.turns.last.feedback).to eq "Correct!"

        new_turn = round.take_turn("Juneau")

        expect(round.turns.last.feedback).to eq "Incorrect."
    end 
end 
