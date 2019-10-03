require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class DeckTest < Minitest::Test



# require 'minitest/autorun'
# require 'minitest/pride'
# require './lib/card'
# require './lib/deck'
#
# class DeckTest < Minitest::Test
#
#   def setup
#     @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#     @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#     @card_3 = Card.new("Describe in words the exact direction that is 697.5 clockwise from due north?", "North north west", :STEM)
#     @cards = [@card_1, @card_2, @card_3]
#     # cards = [card_1, card_2, card_3]
#     # @cards = cards
#     @deck = Deck.new(@cards)
#
#     @stem_array = [@card_2, @card_3]
#     @geography_array = [@card_1]
#     @pop_culture_array = []
#
#   end
#
#   def test_it_exists
#     assert_instance_of Deck, @deck
#   end
#
#   def test_initialize
#     assert_equal [@card_1, @card_2, @card_3], @deck.cards
#   end
#
#   def test_it_is_an_array
#   end
#
#   def test_array_elements_are_objects
#   end
#
#   def test_number_of_cards
#     assert_equal 3, @cards.length
#   end
#
#   def test_categories
#
#     # assert_equal cards_in_category(:STEM) == @stem_array
#     # assert_equal cards_in_category(:Geography) == @geography_array
#     # assert_equal cards_in_category("Pop Culture") == @pop_culture_array
#   end
#
# end

# #Test: do the cards have a category?
# #Test: do the tests return based on a given category?
# #Test: does it exist?
# # Test: does the deck return the number of cards in the deck?
# #Test: is the array filled with card objects?
# # def test_elements_are_objects
# #   assert_equal @card.kind_of?(Object) == true
# #Test: is it an array?
# # def test_it_is_an_array
# #   assert_equal @deck.kind_of?(Array) == true
# # end
