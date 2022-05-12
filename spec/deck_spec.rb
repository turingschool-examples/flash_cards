require 'rspec'
require './lib/card'
# require './lib/turn'
require './lib/deck'
# require './lib/round'

describe Deck do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    deck = Deck.new
    expect(deck).to be_instance_of(Deck)
  end
end 
