require './lib/turn'
require './lib/card'
require './lib/deck'


class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.shift
  end

  def take_turn(guess)
    self.current_card
  end


end
