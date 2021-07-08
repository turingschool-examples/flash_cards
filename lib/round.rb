require './lib/turn'

class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(current_guess)
    new_turn = Turn.new(current_guess, current_card)
  end
end
