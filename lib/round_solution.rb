# require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_accessor :turns, :deck, :current_card, :number_correct, :correct_turns

  def initialize(deck)
    @deck = deck
    @current_card = deck.cards[0]
    @turns = []
    @number_correct = 0
    @correct_turns= []
  end

  def take_turn(string_as_guess)
    new_turn = Turn.new(string_as_guess, current_card)
    @turns << new_turn
    new_turn
  end

#this is a new addition
  def correct_counter
    @number_correct
  end

#currently working on this method
  def number_correct
    turns.each do |turn|
      if turn.correct?
        correct_turns << turn
      end
    end
      correct_turns.size
  end


end
