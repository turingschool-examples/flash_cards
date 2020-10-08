require "Minitest/autorun"
require "Minitest/pride"
require "./lib/card_generator"


class CardGeneratorTest < Minitest::Test
  def test_it_exists
    filename = "./lib/cards.txt"
    card_generator = CardGenerator.new(filename)

    assert_instance_of CardGenerator, card_generator
  end

  def test_it_opens_file
    filename = "./lib/cards.txt"
    card_generator = CardGenerator.new(filename)
    card_generator.open_file
    require 'pry'; binding.pry
  end
end