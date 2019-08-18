require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/round'
require './lib/deck'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
    @card_2 = Card.new("What is the capital of Washington?", "Olympia", :Geography)
    @card_3 = Card.new("Which planet is furthest from the sun?", "Neptune", :Astronomy)
    @card_4 = Card.new("Which spiral galaxay is closest to the milky way?", "Andromeda", :Astronomy)
    @card_5 = Card.new("What is the most common element in the human body?", "Oxygen", :Biology)
    @card_6 = Card.new("What is the largest living organism on the planet?","The honey mushroom", :Biology)

    @cards = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6]

    @deck = Deck.new(@cards)

    @round = Round.new(@deck)
  end

  def test_if_round_exists
    assert_instance_of Round, @round
  end

  def test_deck_has_round
    assert_equal @deck, @round.deck
  end

  def test_turns_in_round
    assert_equal [], @round.turns
  end

  # def test_first_card_in_deck
    # assert_equal @deck[0], @round.current_card
  # end
end
