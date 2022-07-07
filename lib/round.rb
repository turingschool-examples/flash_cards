require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_accessor :turns, :deck, :current_card, :number_correct, :correct_turns

  def initialize(deck)
    @deck = deck
    @current_card = deck.cards[0]
    @turns = []
    @correct_turns = []
  end


  def take_turn(string_as_guess)
    new_turn = Turn.new(string_as_guess, current_card)
    @turns << new_turn
    @current_card = deck.cards.rotate![0] #this is working in pry as expected but
    # isn't changing cards when it really matters.
    new_turn
  end

  def number_correct
    turns.each do |turn|
      if turn.correct?
        correct_turns << turn
      end
    end
    correct_turns.size
  end

def number_correct_by_category(category)
  turns.each do |turn|
    if turn.correct? && turn.card.category == category
      correct_turns << turn
    end
  end
  correct_turns.size
end

def percent_correct
   denominator = turns.size
   numerator = correct_turns.size
   ((numerator.to_f/denominator).round(2)) * 100
end

def percent_correct_by_category(category)
  numerator = correct_turns.size
  denominator = turns.size
  ((numerator.to_f/denominator).round(2)) * 100
end

end
