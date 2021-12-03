require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'
require 'rspec'

describe Card do
  it 'card_1 exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card_1).to be_instance_of(Card)
  end

  it 'card_2 exists' do
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    expect(card_2).to be_instance_of(Card)
  end

  it 'card_3 exists' do
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    expect(card_3).to be_instance_of(Card)
  end
end

describe Deck do
  it 'instance contains card array' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card_array = [card_1, card_2, card_3]
    deck = Deck.new(card_array)

    expect(deck.cards).to eq(card_array)
  end
end

describe Round do
  it 'deck instance of Round' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card_array = [card_1, card_2, card_3]
    deck = Deck.new(card_array)
    round = Round.new(deck)

    expect(round).to be_an_instance_of(Round)
  end

  it 'round instance returned' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card_array = [card_1, card_2, card_3]
    deck = Deck.new(card_array)
    round = Round.new(deck)

    expect(round.deck).to eq(deck)
  end

  it 'turns array returned' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card_array = [card_1, card_2, card_3]
    deck = Deck.new(card_array)
    round = Round.new(deck)

    binding.pry
    expect(round.turns).to eq([])
  end
end
