require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn_1 = Turn.new("Juneau", @card_1)
    @turn_2 = Turn.new("Saturn", @card_2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn_1
  end

  def test_initialize
    assert_equal "Juneau", @turn_1.guess
    assert_equal @card_1, @turn_1.card
  end

  def test_if_guess_correct
    assert_equal true, @turn_1.correct?
    assert_equal false, @turn_2.correct?
  end
end
