require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/round'
require './lib/deck'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is capital of Colorado?", "Denver", :Geography)
    @card_2 = Card.new("Why do we have test tubes", "because", :STEM)
    @card_3 = Card.new("Why do we run", "lose weight", :STEM)

    @cards = [@card_1, @card_2, @card_3]

    @deck = Deck.new(@cards)
    @round = Round.new(@deck)

  end

  def test_it_exists
    skip
    assert_instance_of Round, @round
  end

  def test_it_has_a_deck
    skip
    assert_equal @deck, @round.deck
  end

  def test_it_has_a_deck_with_cards
    skip
    assert_equal @round.deck.cards.length, @deck.cards.length
  end

  def test_take_turn_returns_turn_object
    skip
    assert_instance_of Turn, @round.take_turn("Denver")
  end

  def test_num_correct_increments_from_0_to_1
    skip
    @round.take_turn("Denver")
    assert_equal 1, @round.number_correct
  end

  def test_number_correct_does_not_increment_when_wrong_guess
    skip
    @round.take_turn("Superman")
    assert_equal 0, @round.number_correct
  end

  def test_if_we_take_two_turns_should_be_on_second_card
    skip
    @round.take_turn("alaska")
    @round.take_turn("doggo")
    assert_equal "Why do we have test tubes", @deck.cards[1].question
  end

  def test_we_take_two_turns_and_we_should_have_two_turn_obj_in_array
    skip
    @round.take_turn("alaska")
    @round.take_turn("doggo")
    assert_equal 2, @round.turns.count
  end

  def test_we_get_incorrect_feedback_for_an_incorrect_guess
    skip
    @round.take_turn("kite")
    assert_equal "Incorrect", @round.turns.last.feedback
  end

  def test_if_first_test_passes_then_geography_should_bump_by_one
    @round.take_turn("Denver")
    @round.take_turn("because")
    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_if_all_test_pass_then_stem_should_bump_by_two
    @round.take_turn("Denver")
    @round.take_turn("because")
    @round.take_turn("lose weight")
    assert_equal 2, @round.number_correct_by_category(:STEM)
  end

  def test_if_user_wins_one_out_of_two_turns_percentage_test
    @round.take_turn("Denver")
    @round.take_turn("Wrong Answer")
    @round.take_turn("lose weight")
    assert_equal 50.0, @round.percent_correct_by_category(:STEM)
  end

  def test_percentage_correct
    @round.take_turn("Denver")
    @round.take_turn("Wrong Answer")
    @round.take_turn("lose weight")
    assert_equal 67, @round.percent_correct
  end





end





# pry(main)> require './lib/card'
# #=> true
#
# pry(main)> require './lib/turn'
# #=> true
#
# pry(main)> require './lib/deck'
# #=> true
#
# pry(main)> require './lib/round'
# #=> true
#
# pry(main)> card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
#
# pry(main)> card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
#
# pry(main)> card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
#
# pry(main)> deck = Deck.new([card_1, card_2, card_3])
# #=> #<Deck:0x00007fa160a38ed8...>
#
# pry(main)> round = Round.new(deck)
# #=> #<Round:0x00007f972a1c7960...>,
#
# pry(main)> round.deck
# #=> #<Deck:0x00007fa160a38ed8...>
#
# pry(main)> round.turns
# #=> []
#
# pry(main)> round.current_card
# #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
#
# pry(main)> new_turn = round.take_turn("Juneau")
# #=> #<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">
#
# pry(main)> new_turn.class
# #=> Turn
#
# pry(main)> new_turn.correct?
# #=> true
#
# pry(main)> round.turns
# #=> [#<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">]
#
# pry(main)> round.number_correct
# #=> 1
#
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
