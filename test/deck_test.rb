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
       @deck = Deck.new(@cards)
   end


  def test_if_the_cards_are_in_an_array

    assert_instance_of Array, @cards
  end

  def test_if_there_is_a_deck

    assert_instance_of Deck, @deck
  end


  def test_if_the_cards_method_returns_an_array_of_cards

    assert_equal @cards, @deck.cards
  end

  def test_count_how_many_card_in_deck

    assert_equal 3, @deck.count
  end

  def test_the_method_cards_in_category_to_return_an_array_of_the_cards_that_match_the_category
      @cards = [@card_1, @card_2, @card_3]


  assert_equal [@card_1], @deck.cards_in_category(:Geography)
  assert_equal [@card_2, @card_3], @deck.cards_in_category(:STEM)
  assert_equal [], @deck.cards_in_category("Pop Culture")
  end

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
