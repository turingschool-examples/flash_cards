require './lib/turn'
require './lib/card'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []

  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.rotate
    @turns.last
  end







end
