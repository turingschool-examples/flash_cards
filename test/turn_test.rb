
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

def test_has_a_card
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)

  assert_equal card, turn.card
end

def test_has_guess
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)

  assert_equal "Juneau", turn.guess
end

def test_is_correct?
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)
  assert_equal true, turn.correct?
end

def test_feedback
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)
  assert_equal "Correct!",turn.feedback
end






#   def test_it_has_a_question
#     card = Turn.new("What is the capital of Alaska?", "Juneau", :Geography)
#
#     assert_equal "What is the capital of Alaska?", card.question
#   end
#
#   def test_it_has_an_answer
#     card = Turn.new("What is the capital of Alaska?", "Juneau", :Geography)
#
#     assert_equal "Juneau", card.answer
#   end
#
#   def test_it_has_a_category
#     card = Turn.new("What is the capital of Alaska?", "Juneau", :Geography)
#
#     assert_equal :Geography, card.category
#   end
end
