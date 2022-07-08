require './lib/card'
require './lib/deck'
require './lib/turn'
require 'rspec'

RSpec.describe Deck do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("What is the capital of Louisiana?", "Baton Rouge", :Geography)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end

  it 'has an array of cards in the deck' do
    card_1 = Card.new("What is 5 + 5", 10, :Math)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("What is the capital of Louisiana?", "Baton Rouge", :Geography)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.cards_as_array).to eq([card_1, card_2, card_3])
  end

  it 'can count the number of cards in the deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    cards = [card_1, card_2]
    deck = Deck.new(cards)

    expect(deck.count).to eq(2)
  end

  it 'can list the cards in a given category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card_4 = Card.new("What is 5 + 5", 10, :Math)
    cards = [card_1, card_2, card_3, card_4]
    deck = Deck.new(cards)

    expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
  end

  it 'can return an empty array if the selected category has no cards' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.cards_in_category("Pop Culture")).to eq([])
  end

end
