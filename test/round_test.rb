require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require 'pry'

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

  def test_current_card_is_first_card
    assert_equal @card_1, @round.current_card
    refute_equal @card_3 || @card_2, @round.current_card
  end

  def test_take_turn_returns_new_Turn_instance
    assert_instance_of Turn, @round.take_turn("Juneau")
  end

  def test_take_turn_adds_new_turn_to_turns_ary
    assert_equal [@round.take_turn("Juneau")], @round.turns
    assert_equal 1, @round.turns.count
  end

  def test_take_turn_moves_onto_next_card
    @round.take_turn("Juneau")
    assert_equal @card_2, @round.current_card
  end

  def test_number_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    round.take_turn("Juneau")
    assert_equal 1, round.number_correct
  end

  def test_number_correct_by_category
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    round.take_turn("Juneau")

    assert_equal 1, round.number_correct_by_category(:Geography)

    round.take_turn("Mars")

    round.take_turn("North north west")
    assert_equal 2, round.number_correct_by_category(:STEM)

  end

end
