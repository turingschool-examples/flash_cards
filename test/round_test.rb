require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/round'
require './lib/deck'


class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_round_exists
    assert_instance_of Deck, @deck
    assert_instance_of Round, @round
  end

  def test_round_has_deck
    assert_equal @deck, @round.deck
  end

  def test_round_has_turns
    assert_equal [], @round.turns
  end

  def test_round_has_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_take_turn_initiates_new_turn_w_current_card
    new_turn = @round.take_turn("Juneau")
    assert_instance_of Turn, new_turn
  end

  def test_correct_method_returns_true_when_guess_correct
    new_turn = @round.take_turn("Juneau")
    assert new_turn.correct?
    new_turn2 = @round.take_turn("Bob")
    refute new_turn2.correct?
  end

  def test_round_has_turns
    new_turn = @round.take_turn("Juneau")
    assert_equal [new_turn], @round.turns
    new_turn2 = @round.take_turn("Mars")
    new_turn3 = @round.take_turn("North north west")
    assert_equal new_turn2, @round.turns[1]
    assert_equal new_turn3, @round.turns[2]
    assert_equal [new_turn, new_turn2, new_turn3], @round.turns
  end

  def test_number_correct_function
    new_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
    new_turn = @round.take_turn("Mars")
    assert_equal 2, @round.number_correct
  end

  def test_new_take_turn_brings_up_new_card
    assert_equal @card_1, @round.current_card
    new_turn = @round.take_turn("Juneau")
    assert_equal @card_2, @round.current_card
    new_turn = @round.take_turn("Mars")
    assert_equal @card_3, @round.current_card
  end

  #def test_turns_stores_instance_of_turn
    #assert_equal @card_1, round.current_card 

end



  #=> 1

#   pry(main)> round.current_card
#   #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
#
#   pry(main)> round.take_turn("Venus")
#   #=> #<Turn:0x00007f972a215b38...>
#
#   pry(main)> round.turns.count
#   #=> 2
#
#   pry(main)> round.turns.last.feedback
#   #=> "Incorrect."
#
#   pry(main)> round.number_correct
#   #=> 1
#
#   pry(main)> round.number_correct_by_category(:Geography)
#   #=> 1
#
#   pry(main)> round.number_correct_by_category(:STEM)
#   #=> 0
#
#   pry(main)> round.percent_correct
#   #=> 50.0
#
#   pry(main)> round.percent_correct_by_category(:Geography)
#   #=> 100.0
#
#   pry(main)> round.current_card
   #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
