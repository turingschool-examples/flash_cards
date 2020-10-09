require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'

class CardTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end

  def test_it_exists
    assert_instance_of Card, @card
  end

  def test_it_has_attributes
    assert_equal "Juneau", @card.answer
    assert_equal "What is the capital of Alaska?", @card.question
    assert_equal :Geography, @card.category
  end

  def test_double_equal
    card2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    assert_equal @card, card2
  end
end
