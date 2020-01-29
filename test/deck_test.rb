require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/turn'
require 'pry'

class DeckTest < Minitest::Test

  def test_if_card_1_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    assert_instance_of Card, card_1
  end

end


# pry(main)> card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
#
# pry(main)> card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
#
# pry(main)> card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
#
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
