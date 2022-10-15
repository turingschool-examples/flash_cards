require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do
  describe '#initialize' do
    xit 'has empty deck object' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      deck = Deck.new(cards)

      expect(deck).to eq([])
    end
  end


  it 'has cards objects' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    deck = Deck.new(cards)
# require 'pry'; binding.pry
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    expect(cards).to be_instance_of([cards_1, card_2, card_3])
  end
end
