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
  end
end
