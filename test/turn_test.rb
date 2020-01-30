require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_card_exists
    skip
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    assert_instance_of Card, card
  end

  def test_turn_exists
    skip
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn1 = Turn.new("Juneau", card1)
    turn2 = Turn.new("Saturn", card2)
    assert_instance_of Turn, turn1
    assert_instance_of Turn, turn2
  end

  def test_card_method
    skip
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn1 = Turn.new("Juneau", card1)
    turn2 = Turn.new("Saturn", card2)
    assert_equal card1, turn1.card
    assert_equal card2, turn2.card
  end

  def test_guess_method
    skip
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn1 = Turn.new("Juneau", card1)
    turn2 = Turn.new("Saturn", card2)
    assert_equal "Juneau", turn1.guess
    assert_equal "Saturn", turn2.guess
  end

  def test_correct_answer_method
    skip
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn1 = Turn.new("Juneau", card1)
    turn2 = Turn.new("Saturn", card2)
    assert_equal true, turn1.correct?
    assert_equal false, turn2.correct?
  end

  def test_feedback_method
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn1 = Turn.new("Juneau", card1)
    turn2 = Turn.new("Saturn", card2)
    assert_equal "Correct!", turn1.feedback
    assert_equal "Incorrect!", turn2.feedback
  end
end


#pry(main)> turn.feedback
