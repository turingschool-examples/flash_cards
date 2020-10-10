require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card_1, @card_2, @card_3]
        @deck = Deck.new(@cards)
        @round = Round.new(@deck)
  end

  def test_it_exists

    assert_instance_of Round, @round
    assert_instance_of Deck, @round.deck
    assert_equal [], @round.turns
  end

  def test_what_the_current_card_is

    assert_equal @card_1, @round.current_card
  end

  def test_can_it_take_new_turn
     new_turn = @round.take_turn("Juneau")

     assert_equal Turn, new_turn.class
     assert_equal true, new_turn.correct?
     assert_equal [new_turn], @round.turns
   end

   def test_how_many_correct
     new_turn = @round.take_turn("Juneau")

     assert_equal 1, @round.number_correct
   end

   def test_it_can_take_second_turn
     new_turn = @round.take_turn("Venus")



     assert_equal @card_2, @round.current_card
   end

   def it_counts_turns
     new_turn = @round.take_turn("Juneau")
     @round.take_turn("Venus")

     assert_equal 2, @round.turns.count
   end

   def test_does_it_give_feedback
     new_turn = @round.take_turn("Juneau")
     @round.take_turn("Venus")

   assert_equal "Incorrect", @round.turns.last.feedback
  end

  def test_how_many_correct_now
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 1, @round.number_correct
  end

  def test_how_many_correct_by_catogory
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_percentage_correct
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 50%, @round.percent_correct
  end

end
