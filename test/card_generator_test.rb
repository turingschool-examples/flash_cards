require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def setup
    @filename = 'cards.txt'
    @cards = CardGenerator.new(@filename)
  end

  def test_card_generator_exists
    assert_instance_of CardGenerator, @cards
  end

  def test_attributes
    assert_equal 'cards.txt', @filename
  end

  def test_class_generates_cards
    cards = @cards.cards

    assert_equal Card, cards[0].class
  end
end
