require './lib/card'
require './lib/turn'
require 'pry'

RSpec.describe Turn do 
    it "exists" do 
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        
        expect(turn).to be_instance_of(Turn)
    end
    it "returns correct" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        
        expect(turn.correct?).to be true 
    end

     


end


# turn.card

# turn.guess

# turn.correct?

# turn.feedback
