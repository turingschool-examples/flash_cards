require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

#This card functionality has already been tested - this test isn't needed

#  def test_card_exists
#    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#    require "pry"; binding.pry
#    assert_instance_of Card, card_1
#    assert_instance_of Card, card_2
#    assert_instance_of Card, card_3
#  end

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

  def test_cards_to_deck
    skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    assert_instance_of Deck, deck
  end

  def test_cards_method
    skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    assert_equal deck.cards, cards
  end

  def test_count_method
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    assert_equal 3, deck.count
  end


end

#ASK Instructor how you get this to work -- mine returns the iteration of the class AND the cards themselves.
#pry(main)> deck = Deck.new(cards)
#=> <Deck:0x00007fa160a38ed8...>

#  pry(main)> deck.cards_in_category(:STEM)
  #=> [#<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]

#  pry(main)> deck.cards_in_category(:Geography)
  #=> [#<Card:0x00007fa16104e160...>]

#  pry(main)> deck.cards_in_category("Pop Culture")
  #=> []
