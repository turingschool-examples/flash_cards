require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require 'pry'

class TurnTest < MiniTest::Test
  def test_it_exists
    card = Card.new("What is a name that associates with a particular object?", "VARIABLE", :Vocabulary)
    assert_instance_of Card, card
  end

  def test_it_takes_a_turn
    card = Card.new("What is a name that associates with a particular object?", "VARIABLE", :Vocabulary)
    turn = Turn.new("VARIABLE", card)
    assert_equal "VARIABLE", turn.guess
  end

  def test_its_correct
    card = Card.new("What is a name that associates with a particular object?", "VARIABLE", :Vocabulary)
    turn = Turn.new("VARIABLE", card)
    assert turn.correct?
  end
  
  def test_feedback
    card = Card.new("What is a name that associates with a particular object?", "VARIABLE", :Vocabulary)
    turn = Turn.new("VARIABLE", card)
    assert_equal "Correct!", turn.feedback
  end
end
