require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test

  def setup
      @cards = [
          @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography),
          @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM),
          @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
               ]

   end


  def test_if_the_cards_are_in_an_array

    assert_instance_of Array, @cards
  end

  def test_if_there_is_a_deck

    assert_instance_of Deck, @deck
  end
  #
  # def test_if_the_deck_contains_cards
  # end
  #
  # def test_count_how_many_card_in_deck
  # end
  #
  # def test_the_categories_that_exist_on_cards
  #
  # end


end


# def test_card_1_exists
#   card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#
#   assert_instance_of Card, card_1
# end
#
# def test_card_2_exists
#   card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#
#   assert_instance_of Card, card_2
# end
#
# def test_card_3_exists
#   card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#
#   assert_instance_of Card, card_3
# end
