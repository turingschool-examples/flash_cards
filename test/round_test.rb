require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/deck"
require "./lib/turn"
require "./lib/round"

class RoundTest < Minitest::Test

  def test_round_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft was sent to which planet?", "Mars", :STEM)
    card_3 = Card.new("What is the airspeed velocity of an unladen swallow?", "African or European?", :STEM)
    cards = [card_1, card_2, card_3]
    deck =  Deck.new(cards)


    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_round_contains_deck


    assert_instance_of Deck, round.deck
  end

  def test_round_turns_are_an_array

    assert_instance_of Array, round.turns
  end

  def test_current_card_is_a_card

    assert_instance_of Card, round.current_card
  end

  def test_counts_correct_answers

    assert_equal 1, round.number_correct
    # Insert another correct guess here
    assert_equal 2, round.number_correct

  end

  def test_can_take_turns

    assert_instance_of Turn, round.take_turn("guess to question")
  end

  def test_knows_number_correct_by_category

    assert_equal 1, round.number_correct_by_category(:Geography)

  end
end
