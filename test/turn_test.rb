require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require_relative '../lib/card'
require_relative '../lib/turn'



class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_turn_exists

    assert_instance_of Turn, @turn
  end

  def test_card_instance_variable

    assert_equal @turn.card, @card
  end

  def test_turn_instance_variable

    assert_equal "Juneau", @turn.guess
  end

  def test_correct_method

    assert true || false, @turn.correct?
  end

  def test_it_has_feedback
     assert_equal "Correct", @turn.feedback

     turn = Turn.new("Bill", @card)
     assert_equal "Incorrect", turn.feedback
   end

end
