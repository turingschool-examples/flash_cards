require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require 'pry'

class TurnTest < Minitest::Test

  def test_turn_new
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    # binding.pry
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
    #thing on left is class, thing on right is object of class
  end

  def test_turn_attributes
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal card, turn.card
    #assert_equal values of left and right are equal to each other ==
    assert_equal "Juneau", turn.guess
  end

  def test_method_true
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal true, turn.correct?
    #when we call correct on turn.
    #assert_equal values of left and right are equal to each other ==

    assert_equal "Correct!", turn.feedback
end

  def test_method_false
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_equal false, turn.correct?

    assert_equal "Incorrect!", turn.feedback
  end
end
