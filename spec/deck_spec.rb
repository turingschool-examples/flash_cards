require 'rspec'
require './lib/turn'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do

  it 'exists' do
      deck = Deck.new("cards")

    expect(deck).to be_instance_of(Deck)
  end
end
