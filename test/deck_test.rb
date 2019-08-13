require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'

class DeckTest < Minitest::Test

  def test_it_exists
    card1 = Card.new("What is the smallest atomic element?", "Helium",:Chemistry)
    card2 = Card.new("What is banned in Japanese restaurants?", "Tipping", :Law)
    card3 = Card.new("What is illegal to duel with in Massachesetts?", "Water Pistols", :Law)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    card1 = Card.new("What is the smallest atomic element?", "Helium",:Chemistry)
    card2 = Card.new("What is banned in Japanese restaurants?", "Tipping", :Law)
    card3 = Card.new("What is illegal to duel with in Massachesetts?", "Water Pistols", :Law)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_it_has_count_method
    card1 = Card.new("What is the smallest atomic element?", "Helium",:Chemistry)
    card2 = Card.new("What is banned in Japanese restaurants?", "Tipping", :Law)
    card3 = Card.new("What is illegal to duel with in Massachesetts?", "Water Pistols", :Law)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal 3, deck.count
  end

  def test_it_can_count_categories
    card1 = Card.new("What is the smallest atomic element?", "Helium",:Chemistry)
    card2 = Card.new("What is banned in Japanese restaurants?", "Tipping", :Law)
    card3 = Card.new("What is illegal to duel with in Massachesetts?", "Water Pistols", :Law)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal 1, deck.cards_in_category(:Chemistry)
    assert_equal 2, deck.cards_in_category(:Law)
  end

end
