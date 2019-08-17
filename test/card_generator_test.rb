require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def setup
    filename = "./test/cards.txt"
    @cards = CardGenerator.new(filename)
  end

  def test_it_exists
    assert_instance_of CardGenerator, @cards
  end

  def test_file_opens
    assert @cards.card_array
  end

  def test_cards_generated_is_array_of_4
    assert_equal 4, @cards.card_array
  end

end
