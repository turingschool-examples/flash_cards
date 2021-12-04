require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Deck do
  describe "Test Round stuff_1" do
    it "card_1 round_1" do

      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      expect(round.turns).to be_empty#([])

    end

    it "card_1 " do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(round.current_card).to be(card_1)

    end
    it "card_1 test_2 turn_class" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(new_turn.class).to be(Turn)

    end
    it "card_1 test_2 turn_class" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(new_turn.correct?).to be(true)
    end
    #
    it "test round.turns " do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(round.turns).to include(new_turn)
    end

    # it "card_1 test_2 turn_class" do
    #   card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #   card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    #   card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    #   cards = [card_1, card_2, card_3]
    #   deck = Deck.new(cards)
    #   round = Round.new(deck)
    #   new_turn = round.take_turn("Juneau")
    #   new_turn = round.take_turn("Venus")
    #   expect(round.turns).to be(new_turn)
    # end

    # it "card_1 test_2 turn_class" do
    #   card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #   card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    #   card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    #   cards = [card_1, card_2, card_3]
    #   deck = Deck.new(cards)
    #   round = Round.new(deck)
    #   new_turn = round.take_turn("Juneau")
    #   new_turn = round.take_turn("Venus")
    #   expect(round.turns).to be(new_turn)
    # end

    # it "card_1 test_2 turn_class" do
    #   card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #   card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    #   card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    #   cards = [card_1, card_2, card_3]
    #   deck = Deck.new(cards)
    #   round = Round.new(deck)
    #   new_turn = round.take_turn("Juneau")
    #   new_turn = round.take_turn("Venus")
    #   expect(round.number_correct).to eq(1)
    # end

    # it "card_1 test_2 turn_class" do
    #   card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #   card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    #   card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    #   cards = [card_1, card_2, card_3]
    #   deck = Deck.new(cards)
    #   round = Round.new(deck)
    #   new_turn = round.take_turn("Juneau")
    #   new_turn = round.take_turn("Venus")
    #   expect(round.current_card).to be(card_2)
    # end

    # it "card_1 test_2 turn_class" do
    #   card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #   card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    #   card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    #   cards = [card_1, card_2, card_3]
    #   deck = Deck.new(cards)
    #   round = Round.new(deck)
    #   new_turn = round.take_turn("Juneau")
    #   new_turn = round.take_turn("Venus")
    #   expect(round.take_turn("Venus")).to be_instance_of(Turn)
    # end

    # it "card_1 test_2 turn_class" do
    #   card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #   card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    #   card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    #   cards = [card_1, card_2, card_3]
    #   deck = Deck.new(cards)
    #   round = Round.new(deck)
    #   new_turn = round.take_turn("Juneau")
    #   new_turn = round.take_turn("Venus")
    #   expect(round.turns.count).to eq(2)
    # end

    # it "card_1 test_2 turn_class" do
    #   card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #   card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    #   card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    #   cards = [card_1, card_2, card_3]
    #   deck = Deck.new(cards)
    #   round = Round.new(deck)
    #   new_turn = round.take_turn("Juneau")
    #   new_turn = round.take_turn("Venus")
    #   expect(round.turns).to be(card_1)
    #
    # end
  end
end
