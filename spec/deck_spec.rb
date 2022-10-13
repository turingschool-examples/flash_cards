require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'

RSpec.describe Deck do

  it 'has a deck of cards' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", ":Geography")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars" ":STEM")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west" ":STEM")
    deck = Deck.new([card_1, card_2, card_3])

    expect(deck).to be_instance_of(Deck)
  end

  it 'has a count' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", ":Geography")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars" ":STEM")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west" ":STEM")
    deck = Deck.new([card_1, card_2, card_3])

    expect(deck.count).to be eq(cards)
  end
end
