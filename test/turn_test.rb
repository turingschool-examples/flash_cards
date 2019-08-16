require 'minitest/autorun'
require 'minitest/pride'
require "pry"

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

  def test_the_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_if_correct
    assert @turn.correct?
  end

  def test_for_feedback
    binding.pry
    assert_equal "Correct!", @turn.feedback
  end

end
