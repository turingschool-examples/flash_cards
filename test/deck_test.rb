require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @cards = [@card_1, @card_2, @card_3]
  end

  def test_it_exists

    assert_instance_of Deck, @deck
  end

  def test_has_cards

    assert_equal @cards, @deck.cards
  end

  def test_correct_card_count

    assert_equal 3, @deck.count
  end

  def test_cards_in_category

    assert_equal [@card_2, @card_3], @deck.cards_in_category(:STEM)

  end
end
