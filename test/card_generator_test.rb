require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'


class CardGeneratorTest < Minitest::Test

  def test_it_can_exist
    filename = "./cards.txt"

    cards = CardGenerator.new(filename).cards
    card = cards[0]

    assert_instance_of Card, card
  end
end
