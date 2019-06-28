require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require 'pry'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_turn_exists

    assert_instance_of Turn, @turn
  end

  def test_it_has_a_card

    assert_equal @card, @turn.card
  end

  def test_it_has_a_guess

    assert_equal "Juneau", @turn.guess
  end

  def test_it_returns_boolean_for_correct?
    # I'm also guessing that this wont work, but I am trying to see if correct?
    # returns a boolean
    assert true || false, @turn.correct?
  end

  #Make a new test for the wrong guess

  def test_it_has_feedback
    # Also not sure about this text, can I test using or?
    assert_equal "Correct!", @turn.feedback

    @turn = Turn.new("J", @card)
    assert_equal "Incorrect.", @turn.feedback
  end
end
