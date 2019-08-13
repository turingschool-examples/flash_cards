require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  CARD_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  CARD_2 = Card.new("The Viking spacecrafte sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  CARD_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west,", :STEM)
  CARDS = [CARD_1, CARD_2, CARD_3]

  def test_it_exists
    deck = Deck.new(CARDS)

    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    deck = Deck.new(CARDS)

    assert_equal CARDS, deck.cards 
  end

  def test_correct_card_count
    deck = Deck.new(CARDS)

    assert_equal CARDS.length, deck.count
  end

  def test_correct_valid_category_output
    pass = false
    deck = Deck.new(CARDS)

    test_1 = deck.cards_in_category(:Geography)
    test_2 = deck.cards_in_category(:STEM)

    if test_1.eql?([CARD_1]) && test_2.eql?([CARD_2, CARD_3])
      pass = true
    end

    assert_equal true, pass
  end

  def test_correct_invalid_category_output
    deck = Deck.new(CARDS)

    assert_equal [], deck.cards_in_category(:empty)
  end
end
