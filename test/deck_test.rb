require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
  end

  def test_it_exists #passed
    assert_instance_of Card, @card_1
    assert_instance_of Card, @card_2
    assert_instance_of Card, @card_3
  end

  def test_it_has_a_deck #passed
    deck = Deck.new(@cards)

    assert_instance_of Deck, deck
  end

  def test_cards_in_the_deck #passed
    deck = Deck.new(@cards)

    assert_equal @cards, deck.cards
  end

  def test_count_of_cards_in_deck #passed
    deck = Deck.new(@cards)

    assert_equal 3, deck.count
  end

  def test_cards_in_each_category
    deck = Deck.new(@cards)

    assert_equal [@card_2, @card_3], deck.cards_in_category(:STEM)
    assert_equal [@card_1], deck.cards_in_category(:Geography)
    assert_equal [], deck.cards_in_category("Pop Culture")
  end
end
