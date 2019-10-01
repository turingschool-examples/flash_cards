require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/turn'


class TurnTest < Minitest::Test

  # setup test
  def setup
    @mock_card = Card.new("What is the capital of Italy?", "Rome", :geography)
    @mock_turn = Turn.new("Rome", @mock_card)
  end

  def test_it_exists
    assert_instance_of Turn, @mock_turn
  end 

  def test_that_it_returns_the_card
    assert_equal @mock_card, @mock_turn.card
  end

  def test_it_has_a_correct_guess
    assert_equal "Rome", @mock_turn.guess
  end

  def test_it_handles_guess_casing
    turn = Turn.new("RoMe", @mock_card)
    assert turn.correct?
  end

  def test_it_gives_correct_feedback
    # test for correct guess
    assert @mock_turn.correct?
    # test for incorrect guess
    turn_incorrect = Turn.new("Berlin", @mock_card)
    assert_equal false, turn_incorrect.correct?
  end

end