require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

class Turn
    attr_reader :cards, :turns

  def initialize(cards, turns)
    @cards = card
    @turns = turn
  end

  def guess
    @turns.guess #need this to return guess
  end

  def number_correct?
    @cards == correct
  end

  def feedback
    @cards.none? #unsure of what method to call here
  end
end
