require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/card_generator.rb'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    assert_instance_of CardGenerator, create_card_generator
  end

  def test_it_has_data
    assert_equal File.open('./cards.txt').read, create_card_generator.file_string
  end

  def test_it_has_cards
    assert_equal create_cards, create_card_generator.cards
  end

  private

  def create_card_generator
    CardGenerator.new('./cards.txt')
  end

  def create_cards
      card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?","North North West",:STEM)
      card4 = Card.new("What is 5 divided by 2?","2.5",:Math)
      card5 = Card.new("Sally is 2 years old. Her sister is 6. How old will sally be when she is exactly half of her sister's age?","4 years old",:Math)
      [card1,card2,card3,card4,card5]
  end
end
