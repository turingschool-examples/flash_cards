require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_can_load_text_file
    card_generator = CardGenerator.new("./file.txt")
    assert File.exists?("./file.txt")
  end

  def test_can_create_cards_from_text_file
    card_generator = CardGenerator.new("./file.txt")
    card_file = File.readlines("./file.txt")

    assert_equal card_file.count, card_generator.cards.count
    assert_instance_of Card, card_generator.cards[0]
  end
end
