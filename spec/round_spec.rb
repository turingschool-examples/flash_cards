require 'RSpec'
require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Deck do
  describe "Test Round" do
    it "expect array to be empty" do

      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      expect(round.turns).to eq([])

    end

    it "Compare current card for its contents" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(round.current_card).to eq(card_1)

    end

    it "test that new_turn is a Class" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(new_turn.class).to eq(Turn)
    end

    it "check correct?" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(new_turn.correct?).to eq(true)
    end

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

    it "test number_correct" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      new_turn = round.take_turn("Venus")
      expect(round.number_correct).to eq(1)
    end

    # it "round.turns to increment to venus/mars " do
    #   card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #   card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    #   card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    #   cards = [card_1, card_2, card_3]
    #   deck = Deck.new(cards)
    #   round = Round.new(deck)
    #   new_turn = round.take_turn("Juneau")
    #   expect(round.current_card).to eq(card_2)
    #
    # end
    #
    # it "check round.turn to bew new_turn" do
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
    #


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
