require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new(:card)

    expect(deck).to be_instance_of(Deck)
  end

  it 'returns an array of cards' do 
end
