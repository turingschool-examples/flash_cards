require 'rspec'
require './lib/card'
require './lib/deck'

describe Deck do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5 degrees clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck).to be_a(Deck)
  end

  it 'contains an array of cards' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5 degrees clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck.cards).to eq(cards)
  end

  it 'tracks the number of cards it contains' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5 degrees clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck.count).to eq(3)
  end

  it 'tracks which cards are in a given category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5 degrees clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
  end

  it 'tracks which cards are in another given category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5 degrees clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck.cards_in_category(:Geography)).to eq([card_1])
  end

  it 'tracks which cards are in a third given category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5 degrees clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck.cards_in_category(:PopCulture)).to eq([])
  end
end