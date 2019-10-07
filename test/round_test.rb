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
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_a_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_it_takes_a_turn
    assert_instance_of Turn, @round.take_turn("Juneau")
  end

  def test_it_is_correct
    player_turn = @round.take_turn("Juneau")
    assert_equal player_turn.guess, player_turn.card.answer
  end

  def test_number_correct
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct
  end

  def test_number_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Mars")
    @round.take_turn("North north west")
    assert_equal 2, @round.number_correct_by_category(:STEM)
    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:Trivia)
  end

end
