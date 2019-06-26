require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What's the airspeed velocity of an unladen swallow?",
              "I don't know",
              :Biology)
    @turn   = Turn.new("25", @card)
    @turn_2 = Turn.new("I don't know", @card)
  end

  def test_turn_exists
    assert_instance_of Turn, @turn
    assert_instance_of Turn, @turn_2
  end


  def test_card_in_turn
    actual_card = @turn.card
    actual_card_2 = @turn_2.card
    assert_equal @card, actual_card
    assert_equal @card, actual_card_2
  end

  def test_guess_in_turn
    assert_equal "25", @turn.guess
    assert_equal "I don't know", @turn_2.guess
  end

  def test_correct
    assert_equal false, @turn.correct?
    assert_equal true, @turn_2.correct?
  end

  def test_feedback
    assert_equal "Incorrect.", @turn.feedback
    assert_equal "Correct!", @turn_2.feedback
  end

end
