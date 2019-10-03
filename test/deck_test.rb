require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is capital of Colorado?", "Denver", :Geography)
    @card_2 = Card.new("Why do we have test tubes", "because", :STEM)
    @card_3 = Card.new("Why do we run", "lose weight", :STEM)

    @cards = []
    @cards.push(@card_1, @card_2, @card_3)

    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_does_it_count
    assert_equal 3, @deck.count
  end

  def test_has_cards_array
    assert_equal @cards, @deck.cards
  end
  
  def test_does_sort_category
    sorted_deck = [@card_3, @card_2]
    assert_equal sorted_deck, @deck.cards_in_category(:STEM)
  end
end
