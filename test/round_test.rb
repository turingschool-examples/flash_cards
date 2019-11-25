require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'minitest/autorun'
require 'minitest/pride'

class RoundTest < Minitest::Test

  def setup

   @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
   @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)


   @deck = Deck.new([@card1, @card2, @card3])
   @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_attributes
    assert_equal @deck, @round.deck
    assert_equal [], @round.turns
  end

  def test_it_can_get_current_card
    assert_equal @card1, @round.current_card
  end

  def test_it_can_take_new_turn

    assert_equal [], @round.turns
    assert_equal @card1, @round.current_card

    new_turn = @round.take_turn("Juneau")

    assert_equal @card1, @round.current_card
  end

  def test_it_can_check_class
    assert_equal @cards, @cards.class
  end



end
