require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
filename = "cards.txt"

class CardGeneratorTest < Minitest::Test
  def test_card_generator_exists
    @cards = CardGenerator.new(filename).cards
    assert_instance CardGenerator, cards

  end
end
