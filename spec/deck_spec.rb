require 'pry'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  describe "test" do
    it "make card" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      expect(card_1).to be_instance_of(Card)
    end
  end

  describe "test" do
    it "make card" do
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      expect(card_2).to be_instance_of(Card)
    end
  end
#deck = Deck.new
#deck_1.add_card(card_1)
end
