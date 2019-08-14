require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

class TurnTest < Minitest::Test
  # Let's create an instance for the minitest
  def setup
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card_4 = Card.new("Who was the clinical doctor who developed the hormonal birth control pill?", "John Rock", :HISTORY)
    card_5 = Card.new("What area of psychology incorporates the body?", "Somatic Psychology", :HEALTH)
    card_deck = [card_1, card_2, card_3, card_4, card_5]

    deck = Deck.new(card_deck)
    @start_deck = Deck.new(card_deck)
    @round = Round.new(@start_deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_round_has_deck
    assert_equal @start_deck, @round.deck #do we have a deck?
    assert_equal 5, @round.deck.count #Is the deck count correct?
    assert_equal "North north west", @round.deck.cards[2].answer #Is my round deck pulling the right answer?
  end

  # Let's test that a turn can be created
  def test_if_taking_turns_works
    new_turn = @round.take_turn("Juneau")
    assert_instance_of Turn, new_turn
  end

  def test_if_guess_is_correct
     am_i_right = @round.take_turn("Juneau").correct?
     am_i_wrong = @round.take_turn("WAZZAP").correct?
     assert_equal true, am_i_right
     assert_equal false, am_i_wrong
  end

  def test_turns_array
    @round.take_turn("Juneau")
    assert_equal 1, @round.turns.length
  end

  def test_number_correct_collection
    @round.take_turn("Juneau")
    @round.take_turn("WAZZAP")
    @round.take_turn("North north west")
    @round.take_turn("John Rock")

    assert_equal 3, @round.number_correct
    assert_equal 1, @round.number_correct_by_category(:STEM)
    assert_equal 75, @round.percent_correct
    assert_equal 2, @round.turns_per_category(:STEM)
    assert_equal 50, @round.percent_correct_by_category(:STEM)

  end
end
