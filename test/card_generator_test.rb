require './lib/card_generator'
require 'minitest/autorun'
require 'minitest/pride'


class CardGeneratorTest < Minitest::Test

  def test_it_exists

    cards = CardGenerator.new(cards.txt)
    assert_instance_of CardGenerator, cards
  end

  def test_it_can_load_a_file
    filename = File.read("cards.txt").split

    assert_equal filename = "cards.txt", filename
  end

  def test_it_can_parse_data
    filename = File.read("cards.txt").split

    assert_equal cards.txt, filename
  end

end
