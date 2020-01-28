require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'


class DeckTest < Minitest::Test

  def test_deck_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft was sent to which planet?", "Mars", :STEM)
    card_3 = Card.new("What is the airspeed velocity of an unladen swallow?", "African or European?", :STEM)
    cards = [card_1, card_2, card_3]
    deck =  Deck.new(cards)


    assert_instance_of Deck, deck

  end

  def test_deck_gives_an_array_of_cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft was sent to which planet?", "Mars", :STEM)
    card_3 = Card.new("What is the airspeed velocity of an unladen swallow?", "African or European?", :STEM)
    cards = [card_1, card_2, card_3]
    deck =  Deck.new(cards)
    assert_instance_of Array, deck.cards

    deck.cards.each do |card_in_deck|
      assert_instance_of Card, card_in_deck
    end

  end

  def test_count_the_number_of_cards_in_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft was sent to which planet?", "Mars", :STEM)
    card_3 = Card.new("What is the airspeed velocity of an unladen swallow?", "African or European?", :STEM)
    cards = [card_1, card_2, card_3]
    deck =  Deck.new(cards)

    assert_equal 3, deck.count
  end

  def test_count_number_of_cards_in_each_category
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft was sent to which planet?", "Mars", :STEM)
    card_3 = Card.new("What is the airspeed velocity of an unladen swallow?", "African or European?", :STEM)
    cards = [card_1, card_2, card_3]
    deck =  Deck.new(cards)

    assert_equal 2, deck.cards_in_category(:STEM)
    assert_equal 1, deck.cards_in_category(:Geography)

  end



end
