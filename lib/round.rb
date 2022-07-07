require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class Round
  attr_reader :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << @deck.cards[0]
    Turn.new(@deck.cards[0], guess)
  end



end
#
