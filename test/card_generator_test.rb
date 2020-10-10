require './lib/card_generator'
require './lib/card'
require 'minitest/autorun'


class CardGeneratorTest < Minitest::Test

  def test_if_file_readable
    filename = "./lib/cards.txt"
    assert File.readable?(filename)
  end

  def test_if_cards_method_works
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename).cards
    assert_equal "What is 5 + 5?", cards[0].question
  end

end
