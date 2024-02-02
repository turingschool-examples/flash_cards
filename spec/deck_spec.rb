require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    cards = [card]
    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end

  it 'can count how many cards are in the deck' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Nevada?", "Carson City", :Geography)
    card3 = Card.new("What is 2+2?", 4, :Math)
    deck = Deck.new([card1])
    expect(deck.count).to eq(1)

    deck.cards << card2
    expect(deck.count).to eq(2)

    deck.cards << card3
    expect(deck.count).to eq(3)
  end

  it 'can categorize cards' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Nevada?", "Carson City", :Geography)
    card3 = Card.new("What is 2+2?", 4, :Math)
    deck = Deck.new([card1, card2, card3])

    categorized_cards = deck.cards_in_category(:Geography)

    expect(categorized_cards).to eq([card1, card2])
  end

end