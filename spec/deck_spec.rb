#require 'pry' ; binding.pry
require './lib/card'
require './lib/deck'

RSpec.describe Deck do

  it 'exists for card_1, card_2, card_3' do #Is this bad user empathy?
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    expect(card_1).to be_instance_of(Card)
    expect(card_2).to be_instance_of(Card)
    expect(card_3).to be_instance_of(Card)
  end

  it 'exists as a deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end

  it 'returns card instances' do #Why would these be different?
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new(cards)

    expect(deck.cards).to eq(cards)
  end

  it 'returns card count' do #Why would these be different?
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new(cards)

    expect(deck.count).to eq(cards.count)
  end

  it 'returns card in category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new(cards)

    expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
    expect(deck.cards_in_category(:Geography)).to eq([card_1])
    expect(deck.cards_in_category("Pop Culture")).to eq([])
  end

end
