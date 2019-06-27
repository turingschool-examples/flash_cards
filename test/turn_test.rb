require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < MiniTest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_can_reference_the_card
    assert_equal @card, @turn.card
  end

  def test_it_has_a_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_if_the_guess_is_correct?
    assert @turn.correct?

    wrong_turn = Turn.new("Anchorage", @card)
    refute wrong_turn.correct?
  end

  def test_feedback
    assert_equal "Correct!", @turn.feedback

    wrong_turn = Turn.new("Anchorage", @card)
    assert_equal "Incorrect.", wrong_turn.feedback
  end
end
