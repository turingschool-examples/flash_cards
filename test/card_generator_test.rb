require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_card_generator_exists
    filename = 'cards.txt'
    @cards = CardGenerator.new(filename)

    assert_instance_of CardGenerator, @cards
  end

  def test_class_generates_cards
    filename = 'cards.txt'
    cards = CardGenerator.new(filename).cards
  end
end
