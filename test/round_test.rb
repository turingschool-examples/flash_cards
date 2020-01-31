require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("TheThe Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

   def test_it_exists
     assert_instance_of Round, @round
   end

   def test_round_has_a_deck

     assert_equal @deck, @round.deck
   end

   def test_round_has_empty_turns_array
     turns = []
     assert_equal turns, @round.turns
   end

   def test_round_has_current_card

     assert_equal @card1, @round.current_card
   end

   def test_round_take_turn_is_working
     new_turn = @round.take_turn("Juneau")
     new_turn2 = @round.take_turn("Venus")

     assert_equal Turn, new_turn.class
     assert_equal true, new_turn.correct?
     assert_equal 2, @round.turns.count
     assert_equal "Incorrect.", @round.turns.last.feedback
   end

   def test_is_turns_storing_turns
     new_turn = @round.take_turn("Juneau")

     assert_equal [new_turn], @round.turns
   end

   def test_number_correct_works
     new_turn = @round.take_turn("Juneau")
     new_turn2 = @round.take_turn("Venus")


     assert_equal 1, @round.number_correct
     assert_equal 1, @round.number_correct
   end

   def test_new_current_card
     new_turn = @round.take_turn("Juneau")

     assert_equal @card2, @round.current_card
   end

end



# pry(main)> round.number_correct
#=> 1

# pry(main)> round.number_correct_by_category(:Geography)
# #=> 1
#
# pry(main)> round.number_correct_by_category(:STEM)
# #=> 0
#
# pry(main)> round.percent_correct
# #=> 50.0
#
# pry(main)> round.percent_correct_by_category(:Geography)
# #=> 100.0
#
# pry(main)> round.current_card
# #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
