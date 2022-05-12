require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new(:card)

    expect(deck).to be_instance_of(Deck)
  end

  it 'returns an array of cards' do
    deck = Deck.new(:card)


    expect(deck.cards).to eq([@card, @card, @card])

  end

  it 'has a count' do
    deck = Deck.new(:card)

    expect(deck.count).to eq(3)
  end

  xit 'belongs to a certain category' do
    deck = Deck.new(:card)

    expect(deck.cards_in_category(:STEM)). to eq([@card])
  end


end
