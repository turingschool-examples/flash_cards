require './lib/turn'

class Round
  attr_reader :turns, :current_card, :deck, :new_turn

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[0]
    @new_turn
  end

  def take_turn(guess)
    Turn.new(guess, current_card)
  end
end
