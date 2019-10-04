require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
#require '../cards.txt'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    assert_instance_of CardGenerator, cards
  end

  def test_it_has_cards
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
  end
end
