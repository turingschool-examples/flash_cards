require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_generate_cards
    cards = CardGenerator.new("cards.txt").cards

    assert_instance_of Card, cards.first
    assert_equal "camel", cards.first.answer
    assert_equal "STEM", cards.last.category
  end
end
