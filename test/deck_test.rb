require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'


class DeckTest < Minitest::Test
  def setup
    card_1 = Card.new("In what planet does the game 'Skyrim' take place?", "Nirn", :VideoGames)
    card_2 = Card.new("What year were the Colorado Rockies founded?", 1991, :SportsHistory)
    card_3 = Card.new("What famous actor starred in the movies 'The Rocky Horror Picture Show', 'Clue', and 'It'", "Tim Curry", :MovieTrivia)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
  end

  def test_deck_exists
    assert_instance_of Deck, deck
  end
end
