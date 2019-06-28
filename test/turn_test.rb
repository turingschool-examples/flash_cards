require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_turn_exist
    card = Card.new("What is the capital of New York?", "Albany", :Geography)
    turn = Turn.new("Albany", card)
    assert_instance_of Turn, turn
  end

  def test_guess_exist
    card = Card.new("What is the capital of New York?", "Albany", :Geography)
    turn = Turn.new("Albany", card)
    assert_equal "Albany", turn.guess
  end

  def test_card_exist
    card = Card.new("What is the capital of New York?", "Albany", :Geography)
    turn = Turn.new("Albany", card)
    assert_equal card, turn.card
  end

  def test_correct
    card = Card.new("What is the capital of New York?", "Albany", :Geography)
    turn = Turn.new("Albany", card)
    assert_equal turn.guess, card.answer
  end

  def test_feedback
    card = Card.new("What is the capital of New York?", "Albany", :Geography)
    turn = Turn.new("Albany", card)
    assert_equal "Correct!", turn.feedback

    turn = Turn.new("Manhattan", card)
    assert_equal "Incorrect.", turn.feedback
  end
end
