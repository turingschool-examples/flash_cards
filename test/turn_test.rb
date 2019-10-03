require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @turn_2 = Turn.new("Saturn", @card_1)
    @turn_1 = Turn.new("Juneau", @card_1)
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end

  def test_it_exists
    assert_instance_of Turn, @turn_1
  end

  def test_it_has_a_guess
    assert_equal "Juneau", @turn_1.guess
  end

  def test_it_has_a_card
    @turn_1 = Turn.new("Juneau", @card_1)

    assert_equal @card_1, @turn_1.card
  end

  def test_if_it_is_correct
    @turn_1 = Turn.new("Juneau", @card_1)
    @turn_2 = Turn.new("Saturn", @card_1)

    assert_equal true, @turn_1.correct?
    assert_equal false, @turn_2.correct?
  end

  def feedback
    assert_equal "Correct!", @turn_1.feedback
    assert_equal "Incorrect!", @turn_2.feedback
  end
end
