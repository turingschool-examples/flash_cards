require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#
# cards = [card_1, card_2, card_3]
# deck = Deck.new(cards)

  def test_create_3_cards # Is this necessary?
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    assert_instance_of Card, card_1
    assert_instance_of Card, card_2
    assert_instance_of Card, card_3
  end

# Is this necessary?
  def test_create_cards_ary
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    assert_equal card_1, cards[0]
    assert_equal card_2, cards[1]
    assert_equal card_3, cards[2]
  end

  def test_it_exists

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_card_display

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_count_the_cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    assert_equal 3, deck.count
  end

  def test_cards_in_category
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    assert_equal deck.cards_in_category(:Geography), [card_1]

    assert deck.cards_in_category(:Geography).include?(card_1)
    refute deck.cards_in_category(:Geography).include?(card_2)
    refute deck.cards_in_category(:Geography).include?(card_3)

    refute deck.cards_in_category(:STEM).include?(card_1)
    assert deck.cards_in_category(:STEM).include?(card_2)
    assert deck.cards_in_category(:STEM).include?(card_3)

    refute deck.cards_in_category("Pop Culture").include?(card_1)
    refute deck.cards_in_category("Pop Culture").include?(card_2)
    refute deck.cards_in_category("Pop Culture").include?(card_3)
  end
end
