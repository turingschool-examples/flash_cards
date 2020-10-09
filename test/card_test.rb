require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require 'pry'
class CardTest < Minitest::Test
  def test_it_exists
    card = Card.new("What is a name that associates with a particular object?", "Variable", :Vocabulary)
    assert_instance_of Card, card
  end
  def test_it_has_a_question
    card = Card.new("What is a name that associates with a particular object?", "Variable", :Vocabulary)
    assert_equal "What is a name that associates with a particular object?", card.question
  end
  def test_it_has_an_answer
    card = Card.new("What is a name that associates with a particular object?", "Variable", :Vocabulary)
    assert_equal "Variable", card.answer
  end
  def test_it_has_a_category
    card = Card.new("What is a name that associates with a particular object?", "Variable", :Vocabulary)
    assert_equal :Vocabulary, card.category
  end
end
