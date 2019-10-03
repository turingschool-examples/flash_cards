require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'



class TurnTest < Minitest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_card
    assert_equal @card, @turn.card
  end

  def test_it_has_a_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_if_guess_is_correct
    assert_equal true, @turn.correct?
  end

  def test_it_has_feedback
    assert_equal "Correct!", @turn.feedback
  end

  def test_if_guess_is_incorrect
    refute_equal false, @turn.correct?
  end

  def test_it_has_feedback_for_incorrect_answer
    incorrect_turn = Turn.new("ALALALAL", @card)

    assert_equal "Incorrect.", incorrect_turn.feedback
  end
end
