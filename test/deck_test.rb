require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require 'pry'

class TurnTest < Minitest::Test

  def setup
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    @cards = cards
    deck = Deck.new(@cards)
    @deck = deck

  end

  def test_it_has_cards
    assert_equal 3, @cards.count
  end

  def test_it_has_a_card_array
    assert_equal @cards, @deck.cards
  end

  def test_it_has_a_deck
    assert_instance_of Deck, @deck
  end

  def test_deck_has_cards
    assert_equal @cards, @deck.cards
  end


  def test_cards_in_stem_category
    x = @deck.card_category(:STEM)
    assert_equal 2, x.count
  end

  def test_cards_in_geography_category
    x = @deck.card_category(:Geography)
    assert_equal 1, x.count
  end

  def test_cards_in_non_category
    x = @deck.card_category(:Popculture)
    assert_equal 0, x.count
  end

  def test_it_has_category_array
    assert_equal [:Geography, :STEM], @deck.categories
  end
end
