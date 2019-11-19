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

  def test_it_has_attributes
    assert_equal "Juneau", @turn.guess
    assert_equal @card, @turn.card
  end

  def test_if_guess_correct
    assert @turn.correct?
  end

  def test_feedback
    assert_equal "Correct!", @turn.feedback
  end

end
