require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn.rb'
require './lib/card.rb'
require './lib/deck.rb'


class DeckTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_counts_number_of_cards_in_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    assert_equal 3, deck.count
  end

  def test_it_returns_cards_in_given_category
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      assert_equal [card_2, card_3], deck.cards_in_category(:STEM)
    end 

end
