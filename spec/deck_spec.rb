require './lib/card'
require './lib/turn'
require './lib/deck'
require pry

RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new(cards)
    expect(deck).to be_instance_of(Deck)
  end

