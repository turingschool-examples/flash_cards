require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_turn_exists
    card = Card.new("Baby got what?", "Back", :Music_History)
    turn = Turn.new("Back", card)
    turn.card

    assert_instance_of Turn, turn
  end

  def test_card
    card = Card.new("Baby got what?", "Back", :Music_History)
    turn = Turn.new("Back", card)

    assert_instance_of Card, turn.card
  end

  def test_guess_exists
    card = Card.new("Baby got what?", "Back", :Music_History)
    turn = Turn.new("Back", card)

    assert_equal "Back", turn.guess
  end

  def test_if_correct
    card = Card.new("Baby got what?", "Back", :Music_History)
    turn = Turn.new("Back", card)

    assert_equal "Back", card.answer
  end

  def test_feedback
    card = Card.new("Baby got what?", "Back", :Music_History)
    turn = Turn.new("Front", card)

    assert_equal "Sorry, that's not right", turn.feedback

    turn = Turn.new("Back", card)

    assert_equal "You're right!", turn.feedback
  end

end
