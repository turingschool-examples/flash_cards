# deck_spec.rb
require './lib/card'
require './lib/turn'

RSpec.describe Deck do
  it 'exists' do
    card = Card.new('hi', 'bye', :whaatok)
    turn = Turn.new('this is my guess', card)
    deck = Deck.new

    expect(deck).not_to be_nil
  end
end
