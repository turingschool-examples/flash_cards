require './lib/card'
require './lib/deck'
require 'rspec'

describe Deck do
  it 'creates card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)
  end

  it 'creates deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs 
      and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° 
      clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])

    expect(deck).to be_instance_of(Deck)
    expect(deck.cards[0]).to be_instance_of(Card)
    expect(deck.cards).to be_instance_of(Array)
  end

  it 'knows card count' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs 
      and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° 
      clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])

    expect(deck.count).to eq(3)
    expect(deck.count).to eq([card_1, card_2, card_3].length)
  end

  it 'can group based on category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs 
      and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° 
      clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])

    expect(deck.cards_in_category(:STEM).length).to eq(2)
    expect(deck.cards_in_category(:Geography).length).to eq(1)
    expect(deck.cards_in_category("Pop Culture").length).to eq(0)
  end
end