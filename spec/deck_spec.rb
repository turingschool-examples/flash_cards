require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  cards = [card_1, card_2, card_3]

  deck = Deck.new(cards)

  it 'initializes card_1' do
    expect(card_1).to be_instance_of(Card)
  end

  it 'initializes card_2' do
    expect(card_2).to be_instance_of(Card)
  end

  it 'initializes card_3' do
    expect(card_3).to be_instance_of(Card)
  end

  it 'puts cards in array' do
    expect(cards).to eq([card_1, card_2, card_3])
  end

  it 'has deck' do
    expect(deck).to be_instance_of(Deck)
  end

  it 'has cards' do
    deck.cards
  end

  it 'counts cards' do
    deck.count

    expect(deck.count).to eq(3)
  end

  xit 'has cards in category STEM' do
    deck.cards_in_category(:STEM)


  end

  xit 'has cards in category Geography' do
    deck.cards_in_category(:Geography)

    expect(deck.cards_in_category(:Geography)).to
  end

  xit 'has cards in category Pop Culture' do
    deck.cards_in_category("Pop Culture")

    expect(deck.cards_in_category("Pop Culture")).to
  end
end
