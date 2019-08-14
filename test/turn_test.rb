require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def setup
    @card2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end

  def test_it_exists
    turn = Turn.new("Juneau", @card2)

    assert_instance_of Turn, turn
  end

  def test_it_has_a_guess
    turn = Turn.new("Juneau", @card2)

    assert_equal "Juneau", turn.guess
  end

  def test_it_has_a_card
    turn = Turn.new("Juneau", @card2)

    assert_equal @card2, turn.card
  end

  def test_it_is_correct
    turn = Turn.new("Juneau", @card2)

    assert_equal true, turn.correct?
  end

  def test_it_provides_feedback
    turn_1 = Turn.new("Juneau", @card2)
    turn_2 = Turn.new("Anchorage", @card2)

    assert_equal turn_1.feedback, "Correct!"
  end
end
