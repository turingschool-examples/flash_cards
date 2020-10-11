require "minitest/autorun"
require "minitest/pride"
require './lib/card'
require './lib/turn'
require './lib/deck'
require "./lib/round"
require "./lib/card_generator"

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    assert_instance_of Array, cards
    assert_equal 5, cards.count
  end

  def test_cards_in_order
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    assert_equal "What is 5 + 5?", cards[0].question
  end
end
