require './lib/card'
require './lib/turn'

class Round
  attr_reader :deck, :turns, :current_card, :guess

  def initialize(deck, turns, current_card, guess)
    @deck = deck
    @turns = []
    @current_card = []
    @guess = guess
  end

  def deck
    @deck
  end

  def turns
    @turns
  end

  def guess
    @guess == guess
  end

  def current_card
    @current_card == @round.cards.first
    @round.cards << @current_card
  end



end
