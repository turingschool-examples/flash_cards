require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def test_it_exists
    card1 = Card.new("What is real?", "You are.", :Turing)
    card2 = Card.new("What is 2+2?", "4", :Math)
    card3 = Card.new("How great is Turing so far?", "Wonderful!", :Turing)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_round_has_a_deck
    card1 = Card.new("What is real?", "You are.", :Turing)
    card2 = Card.new("What is 2+2?", "4", :Math)
    card3 = Card.new("How great is Turing so far?", "Wonderful!", :Turing)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expected = deck

    assert_equal expected, round.deck
  end

  def test_turns_starts_empty
    card1 = Card.new("What is real?", "You are.", :Turing)
    card2 = Card.new("What is 2+2?", "4", :Math)
    card3 = Card.new("How great is Turing so far?", "Wonderful!", :Turing)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_equal [], round.turns
  end

  def test_returns_current_card
    card1 = Card.new("What is real?", "You are.", :Turing)
    card2 = Card.new("What is 2+2?", "4", :Math)
    card3 = Card.new("How great is Turing so far?", "Wonderful!", :Turing)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_equal card1, round.current_card_detect
  end

  def test_can_take_turn
    card1 = Card.new("What is real?", "You are.", :Turing)
    card2 = Card.new("What is 2+2?", "4", :Math)
    card3 = Card.new("How great is Turing so far?", "Wonderful!", :Turing)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn("You are.")

    assert_instance_of Turn, new_turn
  end

  def test_it_moves_turn_to_array
    card1 = Card.new("What is real?", "You are.", :Turing)
    card2 = Card.new("What is 2+2?", "4", :Math)
    card3 = Card.new("How great is Turing so far?", "Wonderful!", :Turing)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn("You are.")

    assert_equal [new_turn], round.turns
  end

  def test_number_correct_by_category
    card1 = Card.new("What is real?", "You are.", :Turing)
    card2 = Card.new("What is 2+2?", "4", :Math)
    card3 = Card.new("How great is Turing so far?", "Wonderful!", :Turing)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn("You are.")

    round.current_card_detect
    round.take_turn("4")
require "pry"; binding.pry
    assert_equal 1, round.number_correct_by_category(:Math)
    assert_equal 0, round.number_correct_by_category(:Science)

  end

  def test_percentage_correct
    card1 = Card.new("What is real?", "You are.", :Turing)
    card2 = Card.new("What is 2+2?", "4", :Math)
    card3 = Card.new("How great is Turing so far?", "Wonderful!", :Turing)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn("You are.")

    round.current_card_detect
    round.take_turn("4")

    assert_equal 50.0, round.percent_correct
  end
end
