require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do

# test it can create new cards
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    # deck = Deck.new(card)

    expect(card_1).to be_instance_of(Card)
    expect(card_2).to be_instance_of(Card)
    expect(card_3).to be_instance_of(Card)
  end

  # test it can return an array of card instances
  xit 'returns an array of cards' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    expect(cards).to eq(Card) #create method to return array?
  end

  # test the Deck exists
  xit 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    # card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    # card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end
  # test it has the cards

  # test can count the amount of cards

  # test it has categories




end
