require './lib/turn'
require './lib/card'
require './lib/deck'

class Round
  attr_reader :deck,
              :turns

  def initialize(deck_parameter)
    @deck = deck_parameter
    @turns = []
  end

  def current_card
    @deck.cards[0]
    end
  end
