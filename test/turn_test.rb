require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/turn.rb'


class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #Correct turn
    @turn_C = Turn.new("Juneau",@card)

    #Incorrect turn
    @turn_I = Turn.new("Not Juneau",@card)
  end

  def test_it_exists
      assert_instance_of Turn, @turn_C

      assert_instance_of Turn, @turn_I
  end

  def test_it_has_attributes
      assert_equal "Juneau", @turn_C.guess
      assert_equal  @card, @turn_C.card
      assert_equal true, @turn_C.correct?

      assert_equal "Not Juneau", @turn_I.guess
      assert_equal  @card, @turn_I.card
      assert_equal false, @turn_I.correct?
  end

  def test_feedback
    assert_equal "Correct!", @turn_C.feedback

    assert_equal "Incorrect.", @turn_I.feedback
  end

  def test_double_equal
    turn_2 = Turn.new("Juneau",@card)
    assert_equal @turn_C, turn_2
  end
end
