require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
class CardTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end

  def test_it_exists
    @card
    assert_instance_of Card, @card
  end

  def test_it_has_a_question
    @card
    assert_equal "What is the capital of Alaska?", @card.question
  end

  def test_it_has_an_answer
    @card
    assert_equal "Juneau", @card.answer
  end

  def test_it_has_a_category
    @card
    assert_equal :Geography, @card.category
  end

end #end class 
