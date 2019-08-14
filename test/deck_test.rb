require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  # Test deck exists
  def test_it_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card_4 = Card.new("Who was the clinical doctor who developed the hormonal birth control pill?", "John Rock", :HISTORY)
    card_5 = Card.new("What area of psychology incorporates the body?", "Somatic Psychology", :HEALTH)

    card_deck = [card_1, card_2, card_3, card_4, card_5]

    deck = Deck.new(card_deck)

    assert_instance_of Deck, deck
  end

  # Look up minitest instance variables

  # does the deck have 5 cards ?
  def test_cards_in_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card_4 = Card.new("Who was the clinical doctor who developed the hormonal birth control pill?", "John Rock", :HISTORY)
    card_5 = Card.new("What area of psychology incorporates the body?", "Somatic Psychology", :HEALTH)

    card_deck = [card_1, card_2, card_3, card_4, card_5]
    deck = Deck.new(card_deck)

    assert_equal deck.cards.length, 5 #does the deck have 5 cards?
    assert_equal deck.cards.class, Array # are the cards listed as an array of Cards?
    assert_equal deck.cards[0].class, Card # is an individual card of the Card class?
    assert_equal deck.cards[0].category, :Geography # is the category of the card correct?
    assert_equal deck.cards[1].category, :STEM
  end

  # Does the cards_in_category function return an array of categories?
  def test_cards_in_category
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card_4 = Card.new("Who was the clinical doctor who developed the hormonal birth control pill?", "John Rock", :HISTORY)
    card_5 = Card.new("What area of psychology incorporates the body?", "Somatic Psychology", :HEALTH)

    card_deck = [card_1, card_2, card_3, card_4, card_5]
    deck = Deck.new(card_deck)

    assert_equal deck.cards_in_category(:STEM).length, 2 
    assert_equal deck.cards_in_category(:STEM).class, Array
  end

end
