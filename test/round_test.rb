require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Round_test < Minitest::Test

  def setup

    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_round_can_contain_turn
    assert_equal [], @round.turns
  end

  def test_current_card_for_round
    assert_equal @card_1, @round.current_card
  end

  def test_class_of_new_turn #Why new turn returns array and pattern says return "Turn"?
    new_turn = @round.take_turn("Juneau")

    assert_equal Turn, new_turn.class
  end

  def test_correct_answer
    new_turn = @round.take_turn("Juneau")

    assert_equal true, @round.turns.first.correct?
  end

  def test_number_correct_works
    assert_equal 0, @round.turns.count

    new_turn_1 = @round.take_turn("Juneau")

    assert_equal 1, @round.turns.count

    assert_equal 1, @round.number_correct

    assert_equal @card_2, @round.current_card

    new_turn_2  = @round.take_turn('Venus')

    assert_equal 2, @round.turns.count

    assert_equal "Incorrect!", @round.turns.last.feedback

    assert_equal 1, @round.number_correct

    assert_equal 1, @round.number_correct_by_category(:Geography)

    assert_equal 0,  @round.number_correct_by_category(:STEM)

    assert_equal 50.0, @round.percent_correct

    assert_equal 100.0, @round.percent_correct_by_category(:Geography)

    assert_equal @card_3, @round.current_card

  end


# pry(main)> round.current_card
#=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
end
