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

    @new_turn = @round.take_turn("Juneau")
  end

  # test Round exists
  def test_it_exists_round

    assert_instance_of Round, @round
  end

  # test my deck is correct
  def test_deck

    assert_equal @deck, @round.deck
  end

  # this doesnt seem to be working because we already name a new turn...
  # def test_turns
  #
  #   assert_equal [], @round.turns
  # end

  # test the current card is the top card of the deck
  def test_current_card

    assert_equal @deck.cards[0], @round.current_card
  end

  def test_new_turn_class

    assert_equal Turn, @new_turn.class
  end

  def test_new_turn_correct

    assert_equal true, @new_turn.correct?
  end


end
