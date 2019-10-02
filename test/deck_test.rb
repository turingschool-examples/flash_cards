require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5 clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    @cards = cards
    @deck = Deck.new(@cards)#, @category)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_number_of_cards
    assert_equal 3, @cards.length
  end

  # def test_card_category
  #
  # end



  end



#Test: do the cards have a category?
#Test: do the tests return based on a given category?




#Test: does it exist?
#Test: does the deck return the number of cards in the deck?


#Test: is the array filled with card objects?
# def test_elements_are_objects
#   assert_equal @card.kind_of?(Object) == true

#Test: is it an array?
# def test_it_is_an_array
#   assert_equal @deck.kind_of?(Array) == true
# end
