require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test

  def test_it_exists
    card = Card1.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_instance_of Card1, card
  end

  def test_it_has_a_question
    card = Card1.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal "What is the capital of Alaska?", card.question
  end

  def test_it_has_an_answer
    card = Card1.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal "Juneau", card.answer
  end

  def test_it_has_a_category
    card = Card1.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal :Geography, card.category
  end
end
