require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'


class RoundTest < Minitest::Test

  def test_round_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("Music is composed of what?", "Notes", :STEM)
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_round_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("Music is composed of what?", "Notes", :STEM)
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_turns
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("Music is composed of what?", "Notes", :STEM)
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_equal [], round.turns
  end

  def test_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("Music is composed of what?", "Notes", :STEM)
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_equal card_1, round.current_card
  end


  def test_take_turn
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("Music is composed of what?", "Notes", :STEM)
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_instance_of Turn , new_turn

    assert_equal [new_turn], round.turns



  end
end
