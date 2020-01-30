require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'

class TurnTest < Minitest::Test

  def test_card_exists
    skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    assert_instance_of Card, card_1
    assert_instance_of Card, card_2
    assert_instance_of Card, card_3
  end

#created this test just so I could pry / confirm that deck starts out empty. Not part of the interaction pattern, so I'm commenting it out.
#  def test_deck_starts_empty
#    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#    deck_1 = Deck.new
#    require "pry"; binding.pry
#    assert_instance_of Deck, deck_1
#  end
#end

#Am I making this too hard? Do I just need an array (not a Deck) containing card_1, card_2, card_3?
def test_add_cards_to_deck
  deck_1 = Deck.new

  deck_1.add_new_card("card_1")
  deck_1.add_new_card("card_2")
  deck_1.add_new_card("card_3")

  assert_equal ["card_1", "card_2", "card_3"], deck_1
end

end



#  pry(main)> cards = [card_1, card_2, card_3]

#  pry(main)> deck = Deck.new(cards)
  #=> #<Deck:0x00007fa160a38ed8...>

#  pry(main)> deck.cards
  #=> [#<Card:0x00007fa16104e160...>, #<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]

#  pry(main)> deck.count
  #=> 3

#  pry(main)> deck.cards_in_category(:STEM)
  #=> [#<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]

#  pry(main)> deck.cards_in_category(:Geography)
  #=> [#<Card:0x00007fa16104e160...>]

#  pry(main)> deck.cards_in_category("Pop Culture")
  #=> []
