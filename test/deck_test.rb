require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

def setup
  @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  @card_4 = Card.new(1, 2, 3)
  @cards = [@card_1, @card_2, @card_3, @card_4]
  @deck =  Deck.new(@cards)
end

  def test_it_exists
     @cards
     @deck

    assert_instance_of Deck, @deck
  end

  def test_if_deck_has_cards
    @cards
    @deck

assert_equal @cards, @deck.cards
end

  def test_number_cards_in_deck
    @card
    @deck
    assert_equal @cards.length, @deck.count
end

  def test_if_has_categories
    @cards
    @deck
  assert_equal [@card_1], @deck.cards_per_category(:Geography)
  assert_equal [@card_2, @card_3], @deck.cards_per_category(:STEM)
  assert_equal [], @deck.cards_per_category("Pop Culture")

end
end
