require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class Turn_test < Minitest::Test
  def test_deck_exists
    card_denver = Card.new("What is the capital of Colorado","Denver",:Geography)
    card_president = Card.new("Who was the first president of the USA","George Washington",:History)
    card_france = Card.new("On which continent is France is located","Europe",:Geography)
    cards_for_deck = [card_denver,card_france,card_president]
    deck = Deck.new(cards_for_deck)
    assert_instance_of Deck, deck
  end

  def test_deck_has_cards
    card_denver = Card.new("What is the capital of Colorado","Denver",:Geography)
    card_president = Card.new("Who was the first president of the USA","George Washington",:History)
    card_france = Card.new("On which continent is France is located","Europe",:Geography)
    cards_for_deck = [card_denver,card_france,card_president]
    deck = Deck.new(cards_for_deck)
    assert_equal cards_for_deck, deck.cards
  end

  def test_deck_count_cards
    card_denver = Card.new("What is the capital of Colorado","Denver",:Geography)
    card_president = Card.new("Who was the first president of the USA","George Washington",:History)
    card_france = Card.new("On which continent is France is located","Europe",:Geography)
    cards_for_deck = [card_denver,card_france,card_president]
    deck = Deck.new(cards_for_deck)
    assert_equal 3, deck.count
  end

  def test_deck_cards_in_category_multiple
    card_denver = Card.new("What is the capital of Colorado","Denver",:Geography)
    card_president = Card.new("Who was the first president of the USA","George Washington",:History)
    card_france = Card.new("On which continent is France is located","Europe",:Geography)
    cards_for_deck = [card_denver,card_france,card_president]
    deck = Deck.new(cards_for_deck)
    assert_equal [card_denver,card_france], deck.cards_in_category(:Geography)
  end

  def test_deck_cards_in_category_single
    card_denver = Card.new("What is the capital of Colorado","Denver",:Geography)
    card_president = Card.new("Who was the first president of the USA","George Washington",:History)
    card_france = Card.new("On which continent is France is located","Europe",:Geography)
    cards_for_deck = [card_denver,card_france,card_president]
    deck = Deck.new(cards_for_deck)
    assert_equal [card_president], deck.cards_in_category(:History)
  end

  def test_deck_cards_in_category_zero
    card_denver = Card.new("What is the capital of Colorado","Denver",:Geography)
    card_president = Card.new("Who was the first president of the USA","George Washington",:History)
    card_france = Card.new("On which continent is France is located","Europe",:Geography)
    cards_for_deck = [card_denver,card_france,card_president]
    deck = Deck.new(cards_for_deck)
    assert_equal [], deck.cards_in_category(:Arts)
  end

end
