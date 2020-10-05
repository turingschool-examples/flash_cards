require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def test_it_has_attributes
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    assert_instance_of Card, card
    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer
    assert_equal :Geography, card.category
  end
end
