require 'minitest'
require 'minitest/autorun'

require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("Who is the cutest cat in the whole world?", "Crona", :Pop_Culture)
    @card_2 = Card.new("What is the corp that cares?", "Evo", :Corporate_Knowledge)
    @card_3 = Card.new("Which corp will kill you if you fail a run?", "Mitsuhama", :Corporate_Knowledge)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  #test exists
  def test_deck_exists
    assert_instance_of Deck, @deck
  end
  #test holds cards
  def test_deck_stores_and_exposes_attributes
    assert_equal @cards, @deck.cards
  end
  #test count
  def test_deck_count
    assert_equal 3, @deck.count

    count_deck = Deck.new([@card_1, @card_2])

    assert_equal 2, count_deck.count
  end

  #test cards_in_category with several categories
  def test_deck_cards_in_category
    assert_equal [@card_1], @deck.cards_in_category(:Pop_Culture)
    assert_equal [@card_2, @card_3], @deck.cards_in_category(:Corporate_Knowledge)
    assert_equal [], @deck.cards_in_category(:Seattle_Street_Knowledge)
  end
end
