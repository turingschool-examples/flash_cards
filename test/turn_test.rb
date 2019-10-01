require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @turn = Turn.new("Juneau", @card)
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_a_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_it_has_a_card
    assert_equal @card, @turn.card
  end

  def test_if_it_is_correct
    @turn = Turn.new("Juneau", @card)

    assert_equal true, @turn.correct?
  end

  def feedback
    @turn.correct?
    
    assert_equal "Correct!", @turn.feedback
  end
end
