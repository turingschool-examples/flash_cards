require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
# require './lib/card'
# require './lib/deck'
# require './lib/turn'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is your favorite color?!" 'Blue!... No, wait, Red!', "Monty Python", :Movie)
    @card_2 = Card.new("Do or do not...There is no try", "Star Wars", :Movie)
    @card_3 = Card.new("Shot me in the goddamn liver, Morty!", "Rick and Morty", :TV)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_turns
    round = Round.new(@deck)
    assert_equal(round.turns, [])
    round.take_turn("Monty Python")
    assert_equal(1, round.turns.count)
    assert_kind_of(Turn, round.turns[0])
  end

end
