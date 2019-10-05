require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test
  def setup
    @card = Card.new("Do or do not...There is no try", "Star Wars", :Movie)
  end

  def test_turn_exists
    turn = Turn.new("Star Wars", @card)
    assert_instance_of(Turn, turn)
  end

  def test_is_card_guess_correct
    turn = Turn.new("Star Wars", @card)
    assert_equal(turn.correct?, true)
  end

  def test_is_card_guess_incorrect
    turn = Turn.new("Game of Wars", @card)
    assert_equal(turn.correct?, false)
  end

  def test_is_feedback_correct
    turn = Turn.new("Star Wars", @card)
    assert_equal(turn.feedback, "Correct!")
  end

  def test_is_feedback_incorrect
    turn = Turn.new("Game of Wars", @card)
    assert_equal(turn.feedback, "Incorrect.")
  end
end
