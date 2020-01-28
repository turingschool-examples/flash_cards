require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists

    turn = Turn.new

    assert_instance_of Turn, turn

  end

  def test_correct_is_true_when_correct
    card = Card.new("What is the airspeed velocity of an unladen swallow?", "African or European?", :STEM)
    turn = Turn.new("African or European?", card)
    assert turn.correct?
  end

  def test_correct_is_false_when_incorrect
    card = Card.new("What is the airspeed velocity of an unladen swallow?", "African or European?", :STEM)
    turn = Turn.new("13 kph", card)
    refute turn.correct?
  end

  def test_feedback_is_correct_when_correct
    card = Card.new("What is the airspeed velocity of an unladen swallow?", "African or European?", :STEM)
    turn = Turn.new("African or European?", card)
    assert_equal "Correct!", turn.feedback

  end

  def test_feedback_is_incorrect_when_incorrect
    card = Card.new("What is the airspeed velocity of an unladen swallow?", "African or European?", :STEM)
    turn = Turn.new("13 kph", card)
    assert_equal "Incorrect.", turn.feedback
  end
end
