require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new("Hydrogen", Card.new("What is the smallest atomic element?","Hydrogen",:Chemistry))

    assert_instance_of Turn, turn
  end

  def test_it_has_a_guess
    turn = Turn.new("Hydrogen", Card.new("What is the smallest atomic element?","Hydrogen",:Chemistry))

    assert_equal "Hydrogen", turn.guess
  end


  def test_it_has_a_card
    card = Card.new("What is the smallest atomic element?","Hydrogen",:Chemistry)
    turn = Turn.new("Hydrogen", card)

    assert_equal card, turn.card
  end

  def test_if_answer_is_correct
    turn = Turn.new("Hydrogen", Card.new("What is the smallest atomic element?","Hydrogen",:Chemistry))

    assert_equal true, turn.correct?
  end

  def test_it_has_feedback
    turn = Turn.new("Hydrogen", Card.new("What is the smallest atomic element?","Hydrogen",:Chemistry))

    assert_equal "Correct!", turn.feedback
  end
end
