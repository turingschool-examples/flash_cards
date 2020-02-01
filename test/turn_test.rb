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


  def test_turn_has_a_card

    assert_equal @card, @turn.card
  end


  def test_turn_has_an_guess

    assert_equal "Juneau", @turn.guess
  end

  def test_turn_is_correct

    assert_equal true, @turn.correct?
  end


  def test_turn_feedback_returns_correct_when_correct

    assert_equal "Correct!", @turn.feedback
  end

  def test_correct_returns_false_when_incorrect

    @turn = Turn.new("Saturn", @card)
    assert_equal false, @turn.correct?

  end

  def test_feedback_returns_incorrect_when_incorrect

    @turn = Turn.new("Saturn", @card)
    assert_equal "Incorrect.", @turn.feedback
  end

end
