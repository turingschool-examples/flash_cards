require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/round'
require './lib/deck'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("Baby got what?", "Back", :Music_History)
    @turn = Turn.new("Back", @card)
  end

  def test_turn_exists
    assert_instance_of Turn, @turn
  end

  def test_turn_card
    assert_equal @card, @turn.card
  end

  def test_guess_exists
    assert_equal "Back", @turn.guess
  end

  def test_if_correct
    assert_equal "Back", @card.answer
  end

  def test_feedback
    assert_equal "You're right!", @turn.feedback
    turn = Turn.new("Front", @card)
    assert_equal "Sorry, that's not right", turn.feedback
  end

end
