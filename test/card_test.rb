require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  def test_exist
    assert_instance_of Card, @card
  end

  def test_attributes
    assert_equal "What is the capital of Alaska?", @card.question
    assert_equal "Juneau", @card.answer
    assert_equal :Geography, @card.category
  end
end
