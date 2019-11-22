require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class CardTest < Minitest::Test


  def test_it_exists 
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end



turn = Turn.new("Juneau", card)

turn.card

turn.guess

turn.correct?

turn.feedback

card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

turn = Turn.new("Saturn", card)

turn.card

turn.guess

turn.correct?

turn.feedback
