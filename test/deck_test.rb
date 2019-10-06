require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require_relative '../lib/card'
require_relative '../lib/turn'
require_relative '../lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    end

  def test_it_works
    deck = Deck.new("string")

    assert_instance_of Deck, @deck
  end

  def test_cards_instance_variable

    assert_equal @deck.cards, @cards
  end

  def test_count_method

    assert_equal @deck.count, 3
  end

  def test_cards_in_category_method

    assert_equal @cards[1,2], @deck.cards_in_category(:STEM)
  end
end
