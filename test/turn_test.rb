require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test
  def test_turn_exists
    card = Card.new("What is the capital of Colorado","Denver",:Geography)
    turn = Turn.new("Denver", card)
    assert_instance_of Turn, turn
  end

  def test_if_turn_has_a_guess
    card = Card.new("What is the capital of Colorado","Denver",:Geography)
    turn = Turn.new("Denver", card)
    assert_equal "Denver", turn.guess
  end

  def test_if_turn_has_a_card
    card = Card.new("What is the capital of Colorado","Denver",:Geography)
    turn = Turn.new("Denver", card)
    assert_equal card, turn.card
  end

  def test_if_turn_correct_returns_if_correct
    card = Card.new("What is the capital of Colorado","Denver",:Geography)
    turn = Turn.new("Denver", card)
    assert_equal true, turn.correct?
  end

  def test_if_turn_correct_returns_if_incorrect
    card = Card.new("What is the capital of Colorado","Denver",:Geography)
    turn = Turn.new("Broomfield", card)
    assert_equal false, turn.correct?
  end

  def test_if_turn_feedback_if_correct
    card = Card.new("What is the capital of Colorado","Denver",:Geography)
    turn = Turn.new("Denver", card)
    assert_equal "Correct!", turn.feedback
  end

  def test_if_turn_feedback_if_incorrect
    card = Card.new("What is the capital of Colorado","Denver",:Geography)
    turn = Turn.new("CHEESE!!!!", card)
    assert_equal "Incorrect.", turn.feedback
  end
end
