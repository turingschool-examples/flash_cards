require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card)
    # your original error on line ten
    # 'initialize'
    # 'new'
    # 'test_it_exists'
    # reads bottom to top. The first message ('initialize') is where the actual error is.

    assert_instance_of Turn, turn
  end
  #
  def test_if_card_pulled_from_deck
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card)

    assert_equal card, turn.card
  end

  def test_guess_answer
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card)

    assert_equal "Anchorage", turn.guess
  end
  # def test_turn_is_correct
    # card = Card.new("What is the capital of Alaska?", "Juneau", :Gepgraphy)
    # turn = Turn.new("Anchorage", card)
    #

end
