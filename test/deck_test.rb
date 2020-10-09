require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/deck.rb'


class DeckTest < Minitest::Test

  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?","North North West",:STEM)
    @cards = [@card1,@card2,@card3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_attributes
    assert_equal @cards.length, @deck.count
    assert_equal @cards, @deck.cards
  end

  def test_can_find_cards_in_category
    assert_equal [@cards[0]], @deck.cards_in_category(:Geography)
    assert_equal [@cards[1],@cards[2]], @deck.cards_in_category(:STEM)
  end
end
