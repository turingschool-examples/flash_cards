require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'


class TurnTest < Minitest::Test

  def test_does_turn_exist
    card = Card.new("What is the capital of Italy?", "Rome", :Geography)
    turn = Turn.new("Rome", card)

    assert_instance_of Turn, turn
  end

  def test_does_turn_have_a_guess
    card = Card.new("What is the capital of Italy?", "Rome", :Geography)
    turn = Turn.new("Rome", card)

    assert_equal "Rome", turn.guess
  end

  def test_does_turn_have_a_card
    card = Card.new("What is the capital of Italy?", "Rome", :Geography)
    turn = Turn.new("Rome", card)

    assert_equal card, turn.card
  end

  def test_turn_feedback
    card = Card.new("What is the capital of Italy?", "Rome", :Geography)
    turn = Turn.new("Rome", card)

    assert_equal "Correct!", turn.feedback

    turn = Turn.new("Denver", card)

    assert_equal "Incorrect!", turn.feedback
  end

  def test_turn_correct
    card = Card.new("What is the capital of Italy?", "Rome", :Geography)
    turn = Turn.new("Rome", card)

    assert_equal turn.guess, card.answer
  end
end
