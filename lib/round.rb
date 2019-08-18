require './lib/card'
require './lib/turn'
require './lib/deck'


class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @deck.cards.shift)
  end

  def current_card
    @turns.last.card
  end
end
