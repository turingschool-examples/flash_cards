require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_if_guess_is_correct
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal true, turn.correct?
  end

  def test_if_guess_is_incorrect
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Fairbanks", card)

    assert_equal false, turn.correct?
  end

  def test_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    # require "pry"; binding.pry
    assert_equal "Correct!", turn.feedback

    turn2 = Turn.new("Fairbanks", card)
    turn2.correct?
    # require "pry"; binding.pry
    assert_equal "Incorrect!", turn2.feedback
  end
end
