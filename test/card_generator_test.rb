require "Minitest/autorun"
require "Minitest/pride"
require "./lib/card_generator"


class CardGeneratorTest < Minitest::Test
  def test_it_exists
    filename = "cards.txt"
    card_generator = CardGenerator.new(filename)

    assert_instance_of CardGenerator, card_generator
  end
end