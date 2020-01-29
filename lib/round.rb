require './lib/turn'
class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.size]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    return turn
  end
end
