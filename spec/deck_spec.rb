require './lib/card'
require './lib/turn'
require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)
    expect(deck).to be_instance_of(Deck)
  end

  it 'a deck contains three cards' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    expect(deck.cards.count).to eq(3)
    expect(deck.cards.count).to_not eq(2)
    expect(deck.cards.count).to_not eq(4)
  end

  it 'can group the cards in a deck by their category - Geography' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    expect(deck.cards_in_category(:Geography)).to eq([card_1])
    expect(deck.cards_in_category(:Geography)).to_not eq([card_2])
    expect(deck.cards_in_category(:Geography)).to_not eq([card_2, card_3])
  end

  it 'can group the cards in a deck by their category - STEM' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    expect(deck.cards_in_category(:STEM)).to_not eq([card_1])
    expect(deck.cards_in_category(:STEM)).to_not eq([card_2])
    expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
  end
end
