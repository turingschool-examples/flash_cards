require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/card'
require './lib/turn'
require './lib/deck'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_it_exists

    assert_instance_of Round, @round
  end

  def test_it_initializes_with_deck_instance

    assert_instance_of Deck, @round.deck
  end

  def test_it_can_have_turns

    assert_equal [], @round.turns
  end

  def test_take_turn_shifts_deck
# opportunity to test more robustly such as testing to make sure
    assert_equal @card_1, @round.current_card
    @round.take_turn("something")
    assert_equal @card_2, @round.current_card
    @round.take_turn("something")
    assert_equal @card_3, @round.current_card
  end

  def test_it_has_turn
    new_turn = @round.take_turn("Juneau")

    assert_instance_of Turn, new_turn
  end

  def test_turn_has_class
    new_turn = @round.take_turn("Juneau")

    assert_equal Turn, new_turn.class
  end

  def test_new_turn_is_correct
    new_turn = @round.take_turn("Juneau")

    assert_equal true, new_turn.correct?
  end

  def test_it_tracks_multiple_turns
    new_turn = @round.take_turn("Juneau")
    assert_equal @card_2, @round.current_card
    turn_2 = @round.take_turn("Venus")
    assert_equal 2, @round.turns.count
    assert_equal "Incorrect.", @round.turns.last.feedback
    assert_equal 1, @round.number_correct
  end

  def test_number_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("potato")
    @round.take_turn("tomato")
    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_it_can_calculate_percentage_correct
    @round.take_turn("Juneau")
    @round.take_turn("potato")
    assert_equal 50.0, @round.percent_correct
    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
    assert_equal @card_3, @round.current_card
    
  end


end
