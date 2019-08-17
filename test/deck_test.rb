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
  #test count
  #test cards_in_category with several categories
end
