require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/turn'
require '../lib/deck'
require 'pry'

class DeckTest < Minitest::Test

  def setup
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [card_1, card_2, card_3]
    @deck = Deck.new(@cards)

  end

  def test_it_has_three_cards
    # assert_equal 3, @deck.cards.count
    assert_equal @cards, @deck.cards
  end

  def test_it_counts_total_cards
    assert_equal 3, @deck.count
  end

  def test_it_returns_matching_category
    assert_equal 2, @deck.cards_in_category(:STEM).length
    assert_equal 1, @deck.cards_in_category(:Geography).length
    assert_equal 0, @deck.cards_in_category("Pop Culture").length
  end
end
