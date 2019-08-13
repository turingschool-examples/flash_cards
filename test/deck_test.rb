require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class CardTest < Minitest::Test

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecrafte sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west,", :STEM)
    cards = [card_1, card_2, card_3]

  def test_it_exists
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    deck = Deck.new(cards)

    assert_equal cards, deck.cards 
  end

  def test_correct_card_count
    deck = Deck.new(cards)

    assert_equal 3, deck.count
  end

  def test_correct_valid_category_output
    deck = Deck.new(cards)

    assert_equal true, turn.correct?
  end

  def test_correct_invalid_category_output
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Denver", card)

    assert_equal false, turn.correct?
  end
end
