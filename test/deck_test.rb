require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
      and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5 degress clockwise
        from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_deck_exists

    @card_1
    @card_2
    @card_3
    @cards
    @deck

    assert_instance_of Deck, @deck
  end

  def test_deck_has_cards

      @card_1
      @card_2
      @card_3
      @cards
      @deck

      assert_equal @cards, @deck.cards
      assert_equal @card_1, @deck.cards[0]
      assert_equal @card_2, @deck.cards[1]
      assert_equal @card_3, @deck.cards[2]
  end

def test_count_of_cards_in_deck

  @card_1
  @card_2
  @card_3
  @cards
  @deck

  assert_equal @cards.count, @deck.count
end

def test_category_is_stem

  @card_1
  @card_2
  @card_3
  @cards
  @deck

  actual = [@card_2, @card_3]
  expected = @deck.cards_in_category(:STEM)

  assert_equal actual,expected
end

def test_category_is_geography

  @card_1
  @card_2
  @card_3
  @cards
  @deck

  actual = [@card_1]
  expected = @deck.cards_in_category(:Geography)

  assert_equal actual,expected
end

def  test_category_are_popculture

  @card_1
  @card_2
  @card_3
  @cards
  @deck

  actual = []
  expected = @deck.cards_in_category(:Popculture)

  assert_equal actual,expected
end

end #end class
