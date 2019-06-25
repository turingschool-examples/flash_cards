require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What's the airspeed velocity of an unladen swallow?",
              "I don't know",
              :Biology)
    turn = Turn.new("25", card)

    assert_instance_of Turn, turn
  end


  def test_card_in_turn
    card = Card.new("What's the airspeed velocity of an unladen swallow?",
              "I don't know",
              :Biology)
    turn = Turn.new("25", card)
    actual_card = turn.card
    assert_equal actual_card, card
  end

  def test_guess_in_turn
    card = Card.new("What's the airspeed velocity of an unladen swallow?",
              "I don't know",
              :Biology)
    turn = Turn.new("25", card)
    assert_equal "25", turn.guess
  end

  def test_correct
    card = Card.new("What's the airspeed velocity of an unladen swallow?",
              "I don't know",
              :Biology)
    turn = Turn.new("25", card)
    expected_correct = false
    assert_equal expected_correct, turn.correct?
  end

  def test_feedback
    card = Card.new("What's the airspeed velocity of an unladen swallow?",
              "I don't know",
              :Biology)
    turn = Turn.new("25", card)
    assert_equal "Incorrect.", turn.feedback
  end

end
