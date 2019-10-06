require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'
#require './lib/cards'

class TestCardGenerator < Minitest::Test
  def test_for_instance
    filename = "card.txt"
    instance = CardGenerator.new(filename)

    assert_instance_of CardGenerator, instance
  end

  def test_for_array_of_cards
    card_1 = Card.new("What is the sum of 5 + 5?","10","Math")
    card_2 = Card.new("What is the sum of 5 + 10?","15","Math")
    card_3 = Card.new("Capital of Colorado?","denver","Geography")
    card_4 = Card.new("Capital of New York?","albany","Geography")

    cards_1 = [card_1, card_2, card_3, card_4]

    filename = "cards.txt"
    array = CardGenerator.new(filename).cards

    assert_instance_of Array, array
  end

end
