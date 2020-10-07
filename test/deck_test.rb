require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/deck.rb'

def create_cards
  card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?","North North West",:STEM)
  [card1,card2,card3]
end

class DeckTest < Minitest::Test

  def test_it_exists
    deck = Deck.new(create_cards)
    assert_instance_of Deck, deck
  end

  def test_has_cards
    deck = Deck.new(create_cards)
    assert_equal create_cards, deck.cards
  end

  def test_has_count
    deck = Deck.new(create_cards)
    assert_equal create_cards.length, deck.count
  end

  def test_can_find_cards_in_category
    deck = Deck.new(create_cards)
    cards = create_cards
    assert_equal [cards[0]], deck.cards_in_category(:Geography)
    assert_equal [cards[1],cards[2]], deck.cards_in_category(:STEM)
  end
end
