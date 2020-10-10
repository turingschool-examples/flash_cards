require './lib/turn'
require './lib/deck'
require './lib/card'

class Round

  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first #initially works with deck, but I'm thinking @deck will prevent problems in the future for different variables.
  end

#take_turn needs to create a new turn, meaning we need to give it the information needed to create a turn a "guess" and a card.
  def take_turn(guess)
    new_turn = Turn.new(guess, @deck.cards.shift)
    @turns << new_turn
    new_turn
  end

end
