require './lib/turn'
require './lib/card'
require './lib/deck'
require 'pry'



class Round

  attr_reader :deck, :turns, :turn_count

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_count = 0
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    @turn_count += 1
    new_turn = Turn.new(guess,self.current_card)
    @turns << new_turn
    new_turn
  end

  def correct?

    self.take_turn.guess == self.take_turn.answer

  end


end
