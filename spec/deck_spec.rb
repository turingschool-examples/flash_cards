require './lib/card'
require './lib/deck'
require 'pry'

Rspec.descibe Deck do
    it "is a deck" do
        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card1, card2, card3]
        deck = Deck.new(cards)

        expect(deck.cards).to equal (card1, card2, card3)
    end

    it 'storing cards in a deck'
        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card1, card2, card3]
        deck = Deck.new(cards)

        expect(deck.cards).to be (cards)

    it 'has an amount of cards'
end



