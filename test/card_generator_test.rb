require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/round'
require './lib/deck'
require './lib/card_generator'
require 'pry'

class CardTest < Minitest::Test

  def setup
    @filename = "./lib/cards.txt"
    @cards = CardGenerator.new(@filename)
  end

  def test_cards_is_a_generator
    assert_instance_of CardGenerator, @cards
  end

  def test_cards_is_same_file
    assert File.open("./lib/cards.txt"), @cards.file
  end

  def test_data_extraction
    refute_empty @cards.extract_data
  end
end
