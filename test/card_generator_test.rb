require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    filename = 'cards.txt'
    card = CardGenerator.new(filename)

    assert_instance_of CardGenerator, card
  end

  def test_card_method_exists
    filename = 'cards.txt'
    cards = CardGenerator.new(filename).cards

    assert_equal [cards[0], cards[1], cards[2], cards[3]], cards
  end
end
