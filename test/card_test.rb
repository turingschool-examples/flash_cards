require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require 'pry'

class CardTest < Minitest::Test

  def test_card_exists
    
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    assert_instance_of Card, card

    binding.pry
  end

  def test_it_has_a_question

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card = Card.new("Which planet is closes to the sun?", "Mercury", :STEM)

    assert_equal "What is the capital of Alaska?", card.question
  end

  def test_it_has_an_answer

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    assert_equal "Juneau", card.answer
  end

  def test_it_has_a_category

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    assert_equal :Geography, card.category
  end
end
