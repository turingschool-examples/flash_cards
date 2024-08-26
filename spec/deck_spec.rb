require './lib/deck'
require './lib/turn'
require './lib/card'

RSpec.describe Deck do

    it "exists" do 
        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)

         expect(deck).to be_instance_of(Deck)
    end


    it "has multiple cards" do 
        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)

        expect (cards.count).to eq(3)
    end
end