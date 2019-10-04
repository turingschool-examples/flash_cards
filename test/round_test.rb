require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card'

class RoundTest < Minitest::Test

  def setup
    # set up Cards
    # set up Deck made up of Cards
    @round = Round.new(deck)
  end

  def test_initialize
    assert_instance_of Round, @round
  end

  def test_turns
    # returns empty array
    # returns array of used/discarded cards deposited from take_turn method
  end

  def test_current_card
    # returns current card we are using in take_turn (?)
  end

  def test_turns
  end

  def test_take_a_turn
  end

  def test_number_correct
  end

  def test_number_correct
  end

  def test_number_correct_by_category
  end

  def test_total_percent_correct
  end

  def test_percent_correct_by_category
  end



end
