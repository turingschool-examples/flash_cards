require 'rspec'
require './lib/card'
# require './lib/turn'
require './lib/deck'
# require './lib/round'

describe Deck do
  describe "Class existence" do
    it 'exists' do
      deck = Deck.new
      expect(deck).to be_instance_of(Deck)
    end
  end

  describe 'initialize' do
    it 'initializes with an array of card objects' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
        and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5°
        clockwise from due north?", "North north west", :STEM)
      deck = Deck.new(cards)
      expect(deck.cards).to eq([card_1, card_2, card_3])
    end
  end


end
