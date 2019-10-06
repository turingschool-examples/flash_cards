require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card'
require_relative '../lib/card_generator'

#require_relative '../cards.txt'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    assert_instance_of CardGenerator, cards
  end

  def test_it_has_cards
    filename = "cards.txt"
    cards = CardGenerator.new(filename)

    assert_equal true, cards.cards.all? { |card| card.class == Card }
  end
end
