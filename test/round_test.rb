require 'minitest'
require 'minitest/autorun'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("What has a positive charge in an atom?", "Proton", :STEM)
    @card_3 = Card.new("What is the square root of 144?", 12, :STEM)

    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)

  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_new_turn_exists
    assert_instance_of Turn, @round.take_turn("Juneau")
  end

  def test_guess_is_correct
    
  end

end
