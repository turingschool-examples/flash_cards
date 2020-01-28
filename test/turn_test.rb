# copy of card_test wework for Turn class

require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_instance_of Card, card
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
