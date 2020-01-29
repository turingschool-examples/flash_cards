require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class CardTest < Minitest::Test


  def test_it_exists#
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_instance_of Turn, turn
    assert_instance_of Card, card
  end


  def test_turn_has_a_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal "What is the capital of Alaska?", turn.card.question
    assert_equal "Juneau", turn.card.answer
    assert_equal :Geography, turn.card.category
  end
end   

# pry(main)> turn.guess
# #=> "Juneau"
#
# pry(main)> turn.correct?
# #=> true
#
# pry(main)> turn.feedback
# #=> "Correct!"
