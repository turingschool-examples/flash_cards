require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_it_exists
    string = string
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_instance_of Turn, turn
  end

  def test_it_has_attributes
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
    assert_equal card, turn.card


 end
 def test_guess_is_correct
   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   turn = Turn.new("Juneau", card)

   assert_equal true, turn.correct?
 end

 def test_feedback
   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   turn = Turn.new("Juneau", card)

   assert_equal "Correct!", turn.feedback
 end

   def test_feedback_incorrect
     card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
     turn = Turn.new("Saturn", card)
     binding.pry 
     assert_equal "Saturn", turn.guess
     assert_equal false, turn.correct?
     assert_equal "Incorrect.", turn.feedback
   end
 end
