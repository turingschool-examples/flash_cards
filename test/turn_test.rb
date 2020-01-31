require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the Capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Junaeu", card)

    assert_instance_of Turn, turn
  end

  def test_it_has_card
    card = Card.new("What is the Capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Junaeu", card)

    assert_equal card, turn.card
  end

  def test_it_can_return_guess
    card = Card.new("What is the Capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)


    assert_equal "Juneau", turn.guess
  end


  def test_it_can_check_correct
    card = Card.new("What is the Capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)


    assert turn.correct?
    turn = Turn.new("asdf", card)
    refute turn.correct?
  end

  def test_it_can_get_feedback
    card = Card.new("What is the Capital of Alaska?", "Juneau", :Geography)
    correct_turn = Turn.new("Juneau", card)
    incorrect_turn = Turn.new("Wrong", card)

    assert_equal "Correct!", correct_turn.feedback
    assert_equal "Incorrect.", incorrect_turn.feedback
  end


end
