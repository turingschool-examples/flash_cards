
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card'
require_relative '../lib/deck'

class Deck_test < Minitest::Test
  def test_exists
    cards = []
    deck = Deck.new(cards)

    assert_instance_of(Deck, deck)
  end

  def test_cards
    card1 = Card.new("Test", "Test", :test)
    cards = [card1]
    deck = Deck.new(cards)

    assert_equal(cards, deck.cards)
  end

  def test_count
    card1 = Card.new("Test", "Test", :test)
    cards = [card1]
    deck = Deck.new(cards)

    assert_equal(1, deck.count)
  end

  def draw_test
    card1 = Card.new("Test", "Test", :test)
    cards = [card1]
    deck = Deck.new(cards)

    assert_equal(cards.sample, deck.draw)
  end

  def test_list_categories
    card1 = Card.new("test", "test", :test)
    card2 = Card.new("test", "test", :test1)
    card3 = Card.new("test", "test", :test1)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal ["test", "test1"], deck.list_categories
  end

end