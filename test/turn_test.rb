require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_it_has_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_instance_of Card, card
  end



  def test_it_has_turn
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", Card)

    assert_instance_of Turn, turn
  end

  def test_it_has_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", Card)

    assert_equal "Juneau", turn.guess
  end

  def test_if_correct
   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   turn = Turn.new("Juneau", card)

   assert_equal true, turn.correct?
 end

 def test_if_incorrect
   card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
   turn = Turn.new("Saturn", card)

   assert_equal false, turn.correct?
 end

 def test_is_has_correct_guess_feedback
   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   turn = Turn.new("Juneau", card)

   assert_equal "Correct!", turn.feedback
 end

 def test_is_has_incorrect_guess_feedback
   card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
   turn = Turn.new("Saturn", card)

   assert_equal "Incorrect.", turn.feedback
 end

end
