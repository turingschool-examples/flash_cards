require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("TheThe Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @cards_in_category = []
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of  Deck, @deck
  end

  def test_cards_exists
    assert_equal @cards, @deck.cards
  end


  def test_deck_count_cards
    assert_equal 3, @deck.count_cards
  end

  def test_deck_cards_in_category_gegraphy
    @cards.each do |card|
      if card.category == :Geography
        @cards_in_category << card
      end
      return @cards_in_category
      require 'pry'; binding.pry
    end

    assert_equal @cards_in_category, @deck.cards_in_category(:Geography)
  end
end






# pry(main)> cards = [card_1, card_2, card_3]
#
# pry(main)> deck = Deck.new(cards)
# #=> #<Deck:0x00007fa160a38ed8...>
#
# pry(main)> deck.cards
# #=> [#<Card:0x00007fa16104e160...>, #<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]
#
# pry(main)> deck.count
# #=> 3
#
# pry(main)> deck.cards_in_category(:STEM)
# #=> [#<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]
#
# pry(main)> deck.cards_in_category(:Geography)
# #=> [#<Card:0x00007fa16104e160...>]
#
# pry(main)> deck.cards_in_category("Pop Culture")
# #=> []
