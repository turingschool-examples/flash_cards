require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_it_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
      and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5 degress clockwise
      from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards) #7th pry
    assert_instance_of Deck, deck
  end #end first test

  def test_it_has_card
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
        and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5 degress clockwise
        from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      assert_equal cards, deck.cards
      assert_equal card_1, deck.cards[0]
      assert_equal card_2, deck.cards[1]
      assert_equal card_3, deck.cards[2]
  end

def test_count
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
    and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5 degress clockwise
    from due north?", "North north west", :STEM)
  cards = [card_1, card_2, card_3]
  deck = Deck.new(cards)
  assert_equal 3, deck.count
end

# def test_category
#   card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#   card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
#     and reports about the surface of which planet?", "Mars", :STEM)
#   card_3 = Card.new("Describe in words the exact direction that is 697.5 degress clockwise
#     from due north?", "North north west", :STEM)
#   cards = [card_1, card_2, card_3]
#   deck = Deck.new(cards)
#   stem_cards = [card_1, card_2]
#
#   assert_equal stem_cards, deck.cards_in_category(:STEM)
#
# end#end test

end #class
