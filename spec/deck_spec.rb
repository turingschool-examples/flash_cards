require './lib/turn'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do

  it 'exists' do
    cards = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    deck = Deck.new(cards)

    expect(deck).to be_instance_of Deck
  end

  it 'has cards' do
    cards = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    deck = Deck.new(cards)

    expect(deck.cards).to eq(cards)
  end

  it 'returns the count of cards' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("What is the capital of Colombia?", "Bogota", :Geography)
    card_3 = Card.new("What planet is closest to the sun?", "Mercury", :STEM)
    card_4 = Card.new("What year did the Titanic movie come out?", "1997", :Media)
    cards = [card_1, card_2, card_3, card_4]
    deck = Deck.new(cards)

    expect(deck.count).to eq(4)
  end

  it 'returns cards in a given category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("What is the capital of Colombia?", "Bogota", :Geography)
    card_3 = Card.new("What planet is closest to the sun?", "Mercury", :STEM)
    card_4 = Card.new("What year did the Titanic movie come out?", "1997", :Media)
    cards = [card_1, card_2, card_3, card_4]
    deck = Deck.new(cards)

    expect(deck.cards_in_category(:Geography)).to eq([card_1, card_2])
    expect(deck.cards_in_category(:STEM)).to eq([card_3])
    expect(deck.cards_in_category(:Media)).to eq([card_4])
  end

  it 'returns empty array when no cards in a given category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("What is the capital of Colombia?", "Bogota", :Geography)
    card_3 = Card.new("What planet is closest to the sun?", "Mercury", :STEM)
    card_4 = Card.new("What year did the Titanic movie come out?", "1997", :Media)
    cards = [card_1, card_2, card_3, card_4]
    deck = Deck.new(cards)

    expect(deck.cards_in_category(:Pop_Culture)).to eq([])
  end

end
