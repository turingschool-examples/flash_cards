require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [@card_1, @card_2, @card_3]

    @deck = Deck.new(@cards)
  end


  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_the_deck_has_cards
    assert_equal [@card_1, @card_2, @card_3], @deck.cards
  end

  def test_count_the_cards
    assert_equal 3, @deck.count
  end

  def test_cards_in_category_puts_cards_in_correct_category
    assert_equal [@card_1], @deck.cards_in_category(:Geography)
    assert_equal [@card_2, @card_3], @deck.cards_in_category(:STEM)
    assert_equal [], @deck.cards_in_category("pop culture")

    assert_equal true, @deck.cards_in_category(:Geography).include?(@card_1)
    assert_equal true, @deck.cards_in_category(:STEM).include?(@card_2)
    assert_equal true, @deck.cards_in_category(:STEM).include?(@card_3)
  end

  def test_cards_in_category_does_not_put_wrong_cards_in_category
    refute_equal true, @deck.cards_in_category(:Geography).include?(@card_2 || @card_3)
    refute_equal true, @deck.cards_in_category(:STEM).include?(@card_1)
    refute_equal true, @deck.cards_in_category("pop culture").include?(@card_1 || @card_2 || @card_3)
  end
end
