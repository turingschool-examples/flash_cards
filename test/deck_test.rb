require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test

  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("What is my name?", "David", :Personal)
    @card3 = Card.new("What is 30 * 30", "900", :Math)
    @card4 = Card.new("What is the mile high city", "Denver", :Geography)
    @cards = [@card1, @card2, @card3, @card4]
    @deck1 = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck1
  end

  def test_if_it_has_cards
    assert_equal @deck1.cards, @cards
  end

  def test_if_it_counts
    assert_equal 4, @deck1.count
  end

  def test_if_it_does_category
    assert_equal [@card1, @card4], @deck1.cards_in_category(:Geography)
  end

  def test_if_it_has_recalled_cards
    assert_equal @cards, @deck1.recall_cards
  end
end
