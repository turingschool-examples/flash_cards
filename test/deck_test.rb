require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test
  # create instance for minitest
  def setup
    @card_1 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
    @card_2 = Card.new("What is the capital of Washington?", "Olympia", :Geography)
    @card_3 = Card.new("Which planet is furthest from the sun?", "Neptune", :Astronomy)
    @card_4 = Card.new("Which spiral galaxay is closest to the milky way?", "Andromeda", :Astronomy)
    @card_5 = Card.new("What is the most common element in the human body?", "Oxygen", :Biology)
    @card_6 = Card.new("What is the largest living organism on the planet?","The honey mushroom", :Biology)

    @cards_in_deck = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6]

    @deck = Deck.new(@cards_in_deck)

  end

  def test_deck_exists
    assert_instance_of Deck, @deck
  end

  def test_cards_in_deck
     assert_equal @cards_in_deck, @deck.cards_in_deck
   # .cars_in_deck linked to attr_reader
  end

  def test_num_cards_in_deck
    assert_equal 6, @cards_in_deck.length
  end

  def test_cards_in_category

    # assert_equal 2, @cards_in_deck(:Geography)
  # ^figure out why this doesn't work^
  # because cards_in_deck can't give you information about cards in a category on its own!
    assert_equal [@card_1, @card_2], @deck.cards_in_category(:Geography)
    assert_equal [@card_3, @card_4], @deck.cards_in_category(:Astronomy)
    assert_equal [@card_5, @card_6], @deck.cards_in_category(:Biology)
  end
end
