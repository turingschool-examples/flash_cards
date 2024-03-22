require './lib/card'
require './lib/deck'
require "./lib/deck"

RSpec.describe Deck do
    it "exists" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)

        expect(deck)to be_instance_of(Deck)
    end

    it "have show cards" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        Deck.new(cards)
#might need to adjust
        expect(deck.cards)to eq([card_1, card_2, card_3])
    end

    it "show cards in deck" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        Deck.new(cards)
        
        expect(cards.count)to be(3)
    end

    it "checks cards of a category" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        Deck.new(cards)
#may need to be reviewed
        expect(deck.cards_in_category(:STEM))to be([card_2, card_3])
        expect(deck.cards_in_category(:Geography))to be([card_1])
        expect(deck.cards_in_category(:STEM))to be([])
    end
end