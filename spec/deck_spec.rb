require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new(:card)

    expect(deck).to be_instance_of(Deck)
  end

  it 'returns an array of cards' do
    deck = Deck.new(:card)


    expect(deck.cards).to eq([@card])

  end

  xit 'has a count' do
    deck = Deck.new(:card)

    expect(deck.count).to eq(3)
  end
end
