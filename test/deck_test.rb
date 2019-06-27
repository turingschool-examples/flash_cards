require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/round'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is cooler than cool?", "Ice Cold", :Geography)
    @card_2 = Card.new("Music is composed of what?", "Notes", :STEM)
    @cards = [@card_1, @card_2]
    @deck = Deck.new(@cards)
  end

  def test_deck_exists
    assert_instance_of Deck, @deck
  end

  def test_cards_array
    assert_equal [@card_1, @card_2], @deck.cards
  end

  def test_cards_in_category
    assert_equal [@card_2], @deck.cards_in_category(:STEM)
  end

  def test_deck_card_count
    assert_equal 2, @deck.count
  end
end
