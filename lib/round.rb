require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'

class Round
  attr_reader :deck, :turn
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess,@deck.cards.shift)
    @turns << turn
    turn
  end

end
