require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.configure do |config|
    config.formatter = :documentation
end

describe Deck do
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)

        expect(deck).to be_a(Deck)
    end

    it 'has cards' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)

        expect(deck.cards).to eq(cards)
    end

    it 'can count cards' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)

        expect(deck.count).to eq(3)
    end

    it 'can check for cards in a givin category' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)

        expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
        expect(deck.cards_in_category(:Geography)).to eq([card_1])
        expect(deck.cards_in_category("Pop Culture")).to eq([])
    end

    it 'has a list of all categories in its cards' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)

        expect(deck.categories).to eq([:Geography, :STEM])
    end
end