require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/Turn'
require './lib/deck'

class TurnTest < Minitest::Test

  def test_turn_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)
    assert_instance_of Turn, turn
  end

  def test_it_has_a_user_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)
    assert_equal "Juneau", turn.guess
  end

  def test_the_guess_is_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)
    assert_equal false, turn.correct?
  end

  def test_the_guess_is_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card_1)
    assert_equal false, turn.correct?
  end

  def test_correct_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)
    assert_equal "Correct!", turn.feedback
  end

  def test_correct_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card_1)
    assert_equal "Incorrect", turn.feedback
  end
end
