require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test


  def test_it_exists
  deck = Deck.new(Array.new)
    assert_instance_of Deck, deck
  end

  def test_can_count_zero
    deck = Deck.new Array.new
    assert_equal 0, deck.count
  end

  def test_can_count_one
    deck = Deck.new ["i"]
    assert_equal 1, deck.count 
  end

  def test_can_filter_cards_in_category
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new [card_1, card_2, card_3]
    # assert_equal 1, deck.cards_in_category(:Geography).count
    assert_equal card_1, deck.cards_in_category(:Geography).first
  end

  def test_can_filter_cards_in_category
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new [card_1, card_2, card_3]
    # assert_equal 1, deck.cards_in_category(:Geography).count
    assert_equal card_2, deck.cards_in_category(:STEM).first
  end

end
