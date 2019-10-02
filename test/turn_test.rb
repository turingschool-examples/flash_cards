require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require 'pry'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_incorrect
    card = Card.new("What is the capital of Iowa?", "Des Moines", :Geography)
    turn = Turn.new("Davenport", card)

    assert_equal false, turn.correct?
  end

  def test_feedback
    card = Card.new("What is the largest desert on Earth?", "Antarctica", :Dumb_trivia)
    turn = Turn.new("Sahara", card)

    assert_equal "Incorrect.", turn.feedback
  end

  def test_guess_exists
    card = Card.new("What is the largest desert on Earth?", "Antarctica", :Dumb_trivia)
    turn = Turn.new("Sahara", card)

    assert_equal turn.guess, "Sahara"
  end

end
