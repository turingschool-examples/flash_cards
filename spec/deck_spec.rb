require './lib/card'
require './lib/deck'

cards = [
  Card.new("What is my name?", "Rontron", :People),
  Card.new("Where is the best training track?", "Aurora Reservoir", :Places),
  Card.new("How long is the Miami UltraSkate?", "24 hours", :SkateEvents),
  Card.new("Where does the A2A roadskate begin?", "Athens, GA", :SkateEvents)
]

RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end

  it 'holds a deck of cards' do
    deck = Deck.new(cards)

    expect(deck.cards).to eq(cards)
  end

  it 'knows how many cards are in the deck' do
    deck = Deck.new(cards)
    
    expect(deck.count).to eq(4)
  end

  it 'can return cards based on a given category' do
    deck = Deck.new(cards)

    expect(deck.cards_in_category(:People)).to eq([cards[0]])
    expect(deck.cards_in_category(:Places)).to eq([cards[1]])
    expect(deck.cards_in_category(:SkateEvents)).to eq([cards[2], cards[3]])
    expect(deck.cards_in_category(:Business)).to eq([])
  end
end
