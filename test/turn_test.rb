require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_instance_of Card, card
  end

  def test_it_has_a_guess
    turn = Turn.new("Juneau", @card_1)

    assert_equal "Juneau", turn.guess
  end

#   def test_it_has_an_answer
#     turn = Turn.new("What is the capital of Alaska?", "Juneau", :Geography)
#
#     assert_equal "Juneau", card.answer
#   end
#
#   def test_it_has_a_category
#     turn = Turn.new("What is the capital of Alaska?", "Juneau", :Geography)
#
#     assert_equal :Geography, card.category
#   end
# end
