require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card_generator.rb'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    filename = "cards.txt"

    cards = CardGenerator.new(filename)
    assert_instance_of CardGenerator, cards
  end
end
