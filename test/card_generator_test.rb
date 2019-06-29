require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/round'
require './lib/deck'
require './lib/card_generator'

class CardTest < Minitest::Test

  def setup
    @filename = "./lib/cards.txt"
    @card_generator = CardGenerator.new(@filename)
  end

  def test_cards_is_a_generator
    assert_instance_of CardGenerator, @card_generator
  end

  def test_cards_is_same_file
    assert File.open("./lib/cards.txt"), @cards_generator
  end

  def test_data_extraction
    @card_generator
    refute_empty @card_generator.cards
  end
end
