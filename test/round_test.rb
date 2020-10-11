require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/round'
require_relative '../lib/turn'

class RoundTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
       reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5°
       clockwise from due north?", "North north west", :STEM)
       cards = []
       cards << card_1
       cards << card_2
       cards << card_3
       deck = Deck.new(cards)
       round = Round.new(deck)
     end

     def test_current_card
       card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
       card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
          reports about the surface of which planet?", "Mars", :STEM)
       card_3 = Card.new("Describe in words the exact direction that is 697.5°
          clockwise from due north?", "North north west", :STEM)
       cards = []
       cards << card_1
       cards << card_2
       cards << card_3
       deck = Deck.new(cards)
       round = Round.new(deck)
       assert_equal card_1, round.current_card
     end

     def test_take_turn
       card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
       card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
          reports about the surface of which planet?", "Mars", :STEM)
       card_3 = Card.new("Describe in words the exact direction that is 697.5°
          clockwise from due north?", "North north west", :STEM)
       cards = []
       binding.pry
       cards << card_1
       cards << card_2
       cards << card_3
       deck = Deck.new(cards)
       round = Round.new(deck)
       assert_equal "JUNEAU", round.take_turn("Juneau").response
       assert_instance_of Take_turn, round.take_turn("Juneau")

     end
   end
