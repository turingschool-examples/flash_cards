require 'minitest/autorun'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test

    #def setup
       
   # end

    def test_it_exists

        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography) 
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
       
        deck = Deck.new([card_1, card_2, card_3])
       # turn = Turn.new("Juneau", card)
        round = Round.new(deck)
        binding.pry
        assert_instance_of Round, round
    end


end