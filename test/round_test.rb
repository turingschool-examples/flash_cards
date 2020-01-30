require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < MiniTest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_the_deck_has_rounds
    assert_equal @deck, @round.deck
  end

  def test_rounds_have_turns
    assert_equal [], @round.turns
  end

  def test_rounds_current_card_can_be_shown
    assert_equal @card_1, @round.current_card
  end

  def test_new_turns_are_part_of_turn_class
    @new_turn = @round.take_turn("Juneau")
    assert_equal Turn, @new_turn.class
  end

  def test_new_turn_guess_is_correct
    @new_turn = @round.take_turn("Juneau")
    assert @new_turn.correct?
  end

  def test_turns_are_added_to_turns_array
    @new_turn = @round.take_turn("Juneau")
    assert_equal [@new_turn], @round.turns
  end

  def test_number_correct_are_recorded
    @new_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
  end

  def test_turn_changes_after_guess
    @round.current_card
    @round.take_turn("Venus")
  end
end

# pry(main)> round.current_card
# #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
#
# pry(main)> round.take_turn("Venus")
# #=> #<Turn:0x00007f972a215b38...>
#
# pry(main)> round.turns.count
# #=> 2
#
# pry(main)> round.turns.last.feedback
# #=> "Incorrect."
#
# pry(main)> round.number_correct
# #=> 1
#
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
