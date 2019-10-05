# deck_test.rb
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/deck'
require_relative '../lib/card'

class DeckTest < Minitest::Test
  def setup
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [card_1, card_2, card_3]
    #instance variables for 'test_it_has_cards_in_a_category'
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_a_count
    assert_equal 3, @deck.count
  end

  def test_it_has_cards_in_a_category
    assert_equal @cards[1..2], @deck.cards_in_category(:STEM)
    # cards[1..2] only includes :STEM categories
  end
end
