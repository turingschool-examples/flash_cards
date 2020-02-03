require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    filename = './lib/cards.txt'
    card_gen1 = CardGenerator.new(filename)
    assert_instance_of CardGenerator, card_gen1
  end

  def test_it_has_filename
    filename = './lib/cards.txt'
    card_gen1 = CardGenerator.new(filename)
    assert_equal './lib/cards.txt', filename
  end

  def test_it_can_load_cards
    filename = './lib/cards.txt'
    card_gen1 = CardGenerator.new(filename).cards
    assert_equal 4, card_gen1.length
  end
end
