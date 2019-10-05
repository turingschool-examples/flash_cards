require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is your favorite color?!" 'Blue!... No, wait, Red!', "Monty Python", :Movie)
    @card_2 = Card.new("Do or do not...There is no try", "Star Wars", :Movie)
    @card_3 = Card.new("Shot me in the goddamn liver, Morty!", "Rick and Morty", :TV)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_does_deck_exist
    assert_instance_of(Deck, @deck)
  end

  def test_count
    assert_equal(@deck.count, 3)
  end

  def test_cards_in_category
    assert_equal(@deck.cards_in_category(:Movie), [@card_1, @card_2])
    assert_equal(@deck.cards_in_category(:TV), [@card_3])
    assert_equal(@deck.cards_in_category(:Books), [])
  end

  def test_cards_in_deck
    assert_equal(@deck.cards, @cards)
  end
end
