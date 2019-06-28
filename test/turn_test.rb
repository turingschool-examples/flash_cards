require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'


class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Italy?", "Rome", :Geography)
    @turn = Turn.new(@guess, @card)
  end

  def test_exist
    assert_instance_of Turn, @turn
  end

  def test_attributes
    assert_equal "Rome", @turn.guess
    assert_equal @card, @turn.card
  end

  def test_turn_correct_answer_is_correct
    assert @turn.correct?
  end

  def test_turn_incorrect_answer_is_not_correct
    turn_2 = Turn.new("Denver", @card)
    refute turn_2.correct?
  end

  def test_turn_correct_feedback
    assert_equal "Correct.", @turn.feedback
  end

  def test_turn_incorrect_feedback
    turn_2 = Turn.new("Denver", @card)
    assert_equal "Incorrect.", turn_2.feedback
  end
end
