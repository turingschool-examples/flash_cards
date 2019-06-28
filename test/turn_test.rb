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
    assert_equal @card, actual_card
  end

  def test_guess_in_turn
    assert_equal "I don't know", @turn_2.guess
  end

  def test_correct
    refute @turn.correct?
    assert @turn_2.correct?
    new_turn = Turn.new("i don't know", @card)
    assert new_turn.correct?
    new_turn_2 = Turn.new("I DON't KnoW", @card)
    assert new_turn_2.correct?
  end

  def test_feedback
    assert_equal "Incorrect.", @turn.feedback
    assert_equal "Correct!", @turn_2.feedback
  end

end
