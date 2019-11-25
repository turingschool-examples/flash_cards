#Test file for CardGenerator class
require './test/test_helper'
require './lib/card'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    generator = CardGenerator.new("cards.txt")

    assert_instance_of CardGenerator, generator
  end

  def test_starts_with_empty_array
    generator = CardGenerator.new('cards.txt')

    refute nil, generator.cards
  end

  def test_can_generate_cards
    generator = CardGenerator.new("cards.txt")


    assert_instance_of Card, generator.cards[0]
  end

end
