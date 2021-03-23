require_relative '../lib/card.rb'
require_relative '../lib/deck.rb'

RSpec.describe Deck do
  it 'exists' do
    card1 = Card.new("1?", "Yes", :STEM)
    card2 = Card.new("2?", "No", :STEM)
    card3 = Card.new("3?", "Maybe", :STEM)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end
end
