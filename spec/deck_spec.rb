require './lib/card'
require './lib/deck'

card_1 = Card.new("What is my name?", "Rontron", :People)
card_2 = Card.new("Where is the best training track?", "Aurora Reservoir", :Places)
card_3 = Card.new("How long is the Miami UltraSkate?", "24 hours", :SkateEvents)
card_4 = Card.new("Where does the A2A roadskate begin?", "Athens, GA", :SkateEvents)

cards = [card_1, card_2, card_3, card_4]

RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end

  it 'holds a collection of cards' do
    deck = Deck.new(cards)

    expect(deck.cards).to eq(cards)
  end

  it 'knows how many cards are in the deck' do
    deck = Deck.new(cards)
    
    expect(deck.count).to eq(4)
  end

  it 'can return cards based on a given category' do
    deck = Deck.new(cards)

    expect(deck.cards_in_category(:People)).to eq([card_1])
    expect(deck.cards_in_category(:Places)).to eq([card_2])
    expect(deck.cards_in_category(:SkateEvents)).to eq([card_3, card_4])
    expect(deck.cards_in_category(:Business)).to eq([])
  end
end
