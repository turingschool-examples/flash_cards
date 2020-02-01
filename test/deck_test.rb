require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_it_exists
    card1 = Card.new("What is real?", "You are.", :Philosophy)
    card2 = Card.new("What is 2+2?", "4", :Math)
    card3 = Card.new("How great is Turing so far?", "Wonderful!", :Turing)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    card1 = Card.new("What is real?", "You are.", :Philosophy)
    card2 = Card.new("What is 2+2?", "4", :Math)
    card3 = Card.new("How great is Turing so far?", "Wonderful!", :Turing)
    cards = [card1, card2, card3]
    expected = cards
    deck = Deck.new(cards)

    assert_equal expected, deck.cards

  end

  def test_it_can_count_cards
    card1 = Card.new("What is real?", "You are.", :Philosophy)
    card2 = Card.new("What is 2+2?", "4", :Math)
    card3 = Card.new("How great is Turing so far?", "Wonderful!", :Turing)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expected = 3

    assert_equal expected, deck.count

  end

  def test_shows_cards_in_category
    card1 = Card.new("What is real?", "You are.", :Turing)
    card2 = Card.new("What is 2+2?", "4", :Math)
    card3 = Card.new("How great is Turing so far?", "Wonderful!", :Turing)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal [card1, card3], deck.cards_in_category(:Turing)
  end
end
