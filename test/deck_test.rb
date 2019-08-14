require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_cards
    assert_equal @cards, @deck.cards 
  end

  def test_correct_card_count
    assert_equal @cards.length, @deck.count
  end

  def test_correct_valid_category_output
    pass = false
    test_1 = @deck.cards_in_category(:Geography)
    test_2 = @deck.cards_in_category(:STEM)

    if test_1.eql?([@card_1]) && test_2.eql?([@card_2, @card_3])
      pass = true
    end

    assert_equal true, pass
  end

  def test_correct_invalid_category_output
    assert_equal [], @deck.cards_in_category(:empty)
  end
end
