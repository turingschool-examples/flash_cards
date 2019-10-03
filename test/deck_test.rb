require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    card_1 = Card.new("What is the sum of 5 + 5?", 10, :Math)
    card_2 = Card.new("What is the sum of 5 + 10?", 15, :Math)
    card_3 = Card.new("Capital of Colorado?", "denver", :Geography)
    card_4 = Card.new("Capital of New York?", "albany", :Geography)
    @cards = [card_1, card_2, card_3, card_4]
    @deck = Deck.new(@cards)
  end

  def test_for_instance

    assert_instance_of Deck, @deck
  end

  def test_it_has_card

    assert_equal @cards, @deck.cards
  end

  def test_card_counting

    assert_equal 4, @deck.count
  end

  def test_cards_in_category

    assert_equal 2, @deck.cards_in_category(:Math)
  end

end
