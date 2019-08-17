require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("The beaver is the national emblem of what country?", "Canada", :Geography)
    @card3 = Card.new("In what year was the last NBA expansion?", 2004, :Sports)
    @card4 = Card.new("What sport did an astronaut play on the moon in 1971?", "Golf", :Sports)
    @turn1 = Turn.new("Juneau", @card1)
    @cards = [@card1, @card2, @card3, @card4]
    @deck = Deck.new(@cards)
  end

  def test_deck_exists
    # Is the deck object an instance of Deck
    assert_instance_of Deck, @deck
  end

  def test_cards_array_is_created
    # Does the cards array have value != nil
    refute_nil @cards.count
  end

  def test_counting_cards
    # Does the cards array have all the cards in it
    assert_equal @cards.count, [@card1, @card2, @card3, @card4].count
  end

  def test_cards_in_category
    # Count geography category
    assert_equal @deck.cards_in_category(:Geography), [@card1, @card2]
    # Count sports category
    assert_equal @deck.cards_in_category(:Sports), [@card3, @card4]
  end
end
