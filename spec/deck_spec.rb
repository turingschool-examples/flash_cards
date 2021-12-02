require 'pry'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  describe "test_1" do
    it "make card_1" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      expect(card_1).to be_instance_of(Card)
    end
  end

  describe "test_2" do
    it "make card_2" do
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      expect(card_2).to be_instance_of(Card)
    end
  end

  describe "test_3" do
    it "make card_3" do
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      expect(card_3).to be_instance_of(Card)
    end
  end

  describe "test card array" do
    it "make array" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      #deck.add(card_1)
      #deck.add(card_2)
      #deck.add(card_3)
      #binding.pry
      expect(deck.contents).to eq(@cards)
    end
  end

  describe "Test the deck" do
    it "make the deck be a deck" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(deck).to be_instance_of(Deck)
    end
  end

  describe "check categories 1" do
    it "Stem check" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(deck.count).to be(3)
      expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
      expect(deck.cards_in_category(:Geography)).to eq([card_1])
      expect(deck.cards_in_category("pop culture")).to eq([])
    end
  end



end
