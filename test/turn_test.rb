require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_a_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_it_has_a_card
    assert_instance_of Card, @turn.card
    #assert_equal "What is the capital of Alaska?", turn.card.question
  end

  def test_it_has_correct?
    assert_equal TRUE, @turn.correct?
  end

  def test_it_has_feedback
    assert_equal "Correct!", @turn.feedback
  end
end
