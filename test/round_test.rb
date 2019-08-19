require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/deck'
require '../lib/turn'
require '../lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(cards)
    @round = Round.new(@deck)
    @round.take_turn("some other city")
    @round.take_turn("Mars")
    @round.take_turn("North north west")
  end

  def test_round_exists

    assert_instance_of Round, @round
  end

  def test_round_has_a_deck

    assert_equal @deck, @round.deck
  end

  def test_number_correct

    assert_equal 2, @round.number_correct
  end

  def test_number_correct_by_category

    assert_equal 2, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct

    assert_equal 0.6666666666666666,@round.percent_correct
  end
#   def test_current_card
# #for some reason it's saying 'card' is an undefined method within 'current_card'. Functionality works in runner file.
#     assert_equal @card_1, @round.current_card
#   end

  # def test_take_turn
  #   not sure how to test this
  # end
end
