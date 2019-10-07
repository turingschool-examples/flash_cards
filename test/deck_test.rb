require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
# require 'pry'

class DeckTest < Minitest::Test
  # Create setup to make things easier
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("In what planet does the game 'Skyrim' take place?", "Nirn", :VideoGames)
    @card_3 = Card.new("What famous actor starred in the movies 'The Rocky Horror Picture Show', 'Clue', and 'It'?", "Tim Curry", :MovieTrivia)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  # Test that deck exists
  def test_deck_exists
    # Confirm a variable instance of Deck is created
    assert_instance_of Deck, @deck
  end

  def test_it_has_cards
    assert_equal @cards, @deck.cards
  end

  def test_there_are_3_cards
    # Count how many cards are in the deck, confirming 3 are in the deck
    assert_equal 3, @cards.count
    # You can confirm this by using a binding.pry, running the test
    # file in ruby, then entering @cards.count to have a return of 3
  end

  def test_card_in_category_returns
    assert_equal @card_1, @deck.cards_in_category(:Geography)
  end

end
