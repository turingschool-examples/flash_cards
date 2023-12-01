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
end 
