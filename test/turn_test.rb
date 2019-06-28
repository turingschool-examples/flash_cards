require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_a_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_it_returns_empty_string_when_no_guess_is_made
    turn = Turn.new("", @card)
    assert_equal "", turn.guess
  end

  def test_it_has_a_card
    assert_equal @card, @turn.card
  end

  def test_it_has_a_correct_method
    assert @turn.correct?
  end

  def test_it_handles_error_correctly
    turn = Turn.new("Saturn", @card)
    assert_equal false, turn.correct?
  end

  def test_it_returns_feedback
    assert_equal "Correct!", @turn.feedback

    turn = Turn.new("Saturn", @card)

    assert_equal "Incorrect.", turn.feedback
  end

end
