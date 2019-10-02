require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'

class TurnTest < Minitest::Test

  def setup
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(@cards)
    @cards = cards
  end

  def test_it_exists
    deck = Deck.new(@cards)
    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    deck = Deck.new(@cards)
    assert_equal 3, deck.count
  end

  def test_deck_count_is_correct
    deck = Deck.new(@cards)
    assert_equal 3, deck.count
  end

  def test_cards_in_category_STEM
    deck = Deck.new(@cards)
    assert_equal 2, deck.cards_in_category(:STEM).count
  end

  def test_cards_in_category_Geography
    deck = Deck.new(@cards)
    assert_equal 1, deck.cards_in_category(:Geography).count
  end
end
