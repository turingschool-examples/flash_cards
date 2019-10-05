require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("What is the tallest mountain in Russia?", "Mount Elbrus", :Geography)
    @card_3 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_4 = Card.new("Where is the world's largest living aspen grove?", "Utah", :STEM)
    @card_5 = Card.new("How many paintings did Vincent Van Gogh sell during his lifetime?", "1", :Art)
    @card_6 = Card.new("What Spanish painter is often referred to as both the last of the Old Masters and the first of the moderns?", "Francisco de Goya", :Art)

    @cards = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_initialize
    assert_equal [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6], @deck.cards
  end

  def test_number_cards_in_deck
    assert_equal 6, @deck.count
  end
end
