require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require 'pry'

class CardTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("In what measurement is a horse measured?", "In hands", :Horse)
    assert_instance_of Card, card
  end

  def test_it_has_a_question
    card_1 = Card.new("In what measurement is a horse measured?", "In hands", :Horse)
    assert_equal "What is the capital of Alaska?", card.question
  end

  def test_it_has_an_answer
    card_1 = Card.new("In what measurement is a horse measured?", "In hands", :Horse)
    assert_equal "In hands", card.answer
  end

  def test_it_has_a_category
    card_1 = Card.new("In what measurement is a horse measured?", "In hands", :Horse)
    assert_equal :Horse, card.category
  end
end
