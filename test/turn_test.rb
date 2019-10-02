require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  # def test_initialize
  #   assert_instance_of Card, @turn.card
  #   assert_instance_of Turn, @turn
  # end

  def test_initialize
    assert_instance_of Card, @turn.card
    assert_instance_of Turn, @turn
    #Card or card/Turn or turn?
  end

  def test_for_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_for_card
    assert_equal @card, @turn.card
  end

end
