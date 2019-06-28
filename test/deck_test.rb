require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'


class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Italy?", "Rome", :Geography)
    @card_2 = Card.new("What is the capital of England?", "London", :Geography)
    @card_3 = Card.new("What is Japan's form of currency?", "Yen", :Finance)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_does_deck_exist
    assert_instance_of Deck, @deck
  end

  def test_cards_exists
    assert_equal @cards, @deck.cards
  end

  def test_count
    assert_equal @cards.count, @deck.count
  end

  def test_cards_in_category
    @deck.cards_in_category(:Geography)

    assert_equal [@card_1, @card_2], @deck.cards_in_category(:Geography)
    assert_equal [@card_3], @deck.cards_in_category(:Finance)
  end

end
