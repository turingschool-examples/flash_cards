require './lib/card'
require './lib/turn'
require './lib/deck'

class Round

  attr_reader :deck, :turns

  def initialize(deck, turns = [])
    @deck = deck
    @turns = turns
  end

  def current_card
    self.deck.cards.first
  end
end
