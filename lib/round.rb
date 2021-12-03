require './lib/deck'
require './lib/card'
require './lib/turn'
require 'pry'

class Round
  attr_reader :deck, :turns_array, :round

  def initialize(deck)
    @deck = deck
    @turns_array = []
  end

  def deck
    return @deck
  end

  def turns
    @turns_array
  end

  def current_card
    deck.card_array.first
  end

end
