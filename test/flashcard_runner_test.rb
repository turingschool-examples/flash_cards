require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    filename = "./cards.txt"
    cards = CardGenerator.new(filename)

    assert_instance_of CardGenerator, cards
  end

  def test_it_generates_cards_from_file
    filename = "./cards.txt"
    cards = CardGenerator.new(filename)
    deck = Deck.new(cards)

    assert_equal deck.cards, cards
  end

end
