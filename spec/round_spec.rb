require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Deck do
  describe "Test Round stuff" do
    it "make round" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      expect(round).to be_instance_of(Round)
      expect(round.turns).to eq([])
    end
  end

  describe "Test Round stuff_2" do
    it "current_card" do

      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(round.turns).to eq(new_turn)
      #new_turn = round.take_turn("Juneau")
      #binding.pry

      expect(round.number_correct).to be(1)
      # expect(new_turn.current_card.correct?).to be true
      #expect(round.current_card).to be(card_1)
      #expect(new_turn).to be_instance_of(Turn)
    end
  end
end
