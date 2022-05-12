require './lib/turn'
require './lib/card'
require './lib/deck'
require 'pry'



class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess,current_card)
    @turns << new_turn
    new_turn
  end

  def correct?

    self.take_turn.guess == self.take_turn.answer

  end



end
