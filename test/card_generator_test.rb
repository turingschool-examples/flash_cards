#Test file for CardGenerator class
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    generator = CardGenerator.new

    assert_instance_of CardGenerator, generator
  end

  def test_starts_with_empty_array
    generator = CardGenerator.new

    assert_equal [], generator.card_array
  end

  def test_can_generate_cards
    generator = CardGenerator.new

    generator.generate_cards

    assert_instance_of Card, generator.card_array[0]
  end

end
