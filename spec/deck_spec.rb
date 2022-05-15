require './lib/card'
require './lib/deck'
require 'rspec'
require 'pry'

RSpec.describe Deck do
  it 'exists as an object' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck) #test failing?
  end

  it 'has cards in the array' do #done
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    expect(deck.cards.empty?).to eq(FALSE)
  end
  #
  it 'returns the # of items in array' do #done
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    expect(deck.count).to eq(3)
  end
  #

  #
  # it 'has a category' do #done
  #   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #
  #   expect(card.category).to eq(:Geography)
  # end
end
