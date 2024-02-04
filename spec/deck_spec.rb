require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  let(:card1) { Card.new('What is the capital of Alaska?', 'Juneau', :Geography) }
  let(:card2) { Card.new('What is the capital of Nevada?', 'Carson City', :Geography) }
  let(:card3) { Card.new('What is 2+2?', 4, :Math) }

  it 'exists' do
    deck = Deck.new([card1])

    expect(deck).to be_instance_of(Deck)
  end

  it 'can have cards' do
    deck = Deck.new([card1])

    expect(deck.cards).to eq([card1])
  end

  it 'can count how many cards are in the deck' do
    deck = Deck.new([card1])
    expect(deck.count).to eq(1)

    deck.cards << card2
    expect(deck.count).to eq(2)

    deck.cards << card3
    expect(deck.count).to eq(3)
  end

  it 'can categorize cards' do
    deck = Deck.new([card1, card2, card3])

    categorized_cards = deck.cards_in_category(:Geography)

    expect(categorized_cards).to eq([card1, card2])
  end

  it 'can move the first card of the deck to the back' do
    deck = Deck.new([card1, card2, card3])

    expect(deck.cards[0]).to eq(card1)

    deck.move_card_to_back

    expect(deck.cards[0]).to eq(card2)
  end
end