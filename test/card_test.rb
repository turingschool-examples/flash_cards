require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require 'pry'

class CardTest < Minitest::Test

  def test_card_exists
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    assert_instance_of Card, card1
    assert_instance_of Card, card2
    binding.pry
  end

  def test_it_has_a_question

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal "What is the capital of Alaska?", card.question
  end

  def test_it_has_an_answer

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal "Juneau", card.answer
  end

  def test_it_has_a_category
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal :Geography, card.category
  end
end
