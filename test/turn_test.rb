require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_turn_exists
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_it_has_a_guess
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end

  def test_it_returns_boolean_for_correct?
    turn = Turn.new("Juneau", card)
    # I'm also guessing that this wont work, but I am trying to see if correct?
    # returns a boolean
    assert_equal true || false, turn.correct?
  end

  def test_it_has_feedback
    turn = Turn.new("Juneau", card)
    # Also not sure about this text, can I test using or?
    assert_equal "Correct!" || "Incorrect", turn.feedback
  end
end
