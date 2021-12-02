require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Deck do
  it 'exists' do
    round = Round.new()
    expect(deck).to be_instance_of(Deck)
  end
