require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn_1 = Turn.new("Juneau", @card)
    @turn_2 = Turn.new("Detroit", @card)
  end

  def test_it_exists

    assert_instance_of Turn, @turn_1
  end

  def test_it_has_a_guess

    assert_equal "Juneau", @turn_1.guess
  end

  def test_it_has_a_card

    assert_equal @card, @turn_1.card
  end

  def test_correct?

    assert_equal true, @turn_1.correct?

    assert_equal false, @turn_2.correct?
  end

  def test_feedback

    assert_equal "Correct!", @turn_1.feedback

    assert_equal "Incorrect.", @turn_2.feedback
  end

end
