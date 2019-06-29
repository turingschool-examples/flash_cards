require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'

class Deck_test < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_deck_exists
    @deck = Deck.new(@cards)
    assert_instance_of Deck, @deck
    #require 'pry';binding.pry
  end

  def test_category_exist
    x =[@card_2, @card_3]
    assert_equal x , @deck.cards_in_category(:STEM)
  end

  # pry(main)> deck.cards_in_category(:STEM)
  # #=> [#<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]
  #
  # pry(main)> deck.cards_in_category(:Geography)
  # #=> [#<Card:0x00007fa16104e160...>]
  #
  # pry(main)> deck.cards_in_category("Pop Culture")
  # #=> []

end
