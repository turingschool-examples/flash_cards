require "./lib/deck"
require "./lib/turn"
require "./lib/card"

RSpec.describe Deck do 
    before(:each) do
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @turn = Turn.new("Juneau", @card)
    end
    
    it "exists" do 
        deck = Deck.new(@cards) 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
        expect(deck).to be_instance_of(Deck) 
    end 
       
end 