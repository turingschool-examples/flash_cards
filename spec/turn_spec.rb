require "./lib/turn"
require "./lib/card"

RSpec.describe do 
    it "exists" do 
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", @card) 

        expect(turn).to be_instance_of(Turn)
    end 

    it "has a guess" do 
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", @card) 

        expect(turn.guess).to eq "Juneau"
    end 

    it "returns a card" do 
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", @card)

        expect(turn.card).to eq @card 
    end
end 


#initialize(string, card) - A turn is initialized with two arguments. 
#The first is a string representing a guess to a card’s question. 
#The second argument is a Card object representing the current flashcard being shown.
# guess - This method returns the guess
# card - This method returns the Card
# correct? - This method returns a boolean indicating if the guess matched the answer on the Card.
# feedback - This method either returns "Correct!" or "Incorrect." based on whether the guess was correct or not.