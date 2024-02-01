require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new()

    expect(deck).to be_instance_of(Deck)
  end

end