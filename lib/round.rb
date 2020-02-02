require './lib/turn'
require './lib/card'
require './lib/deck'

class Round
  attr_reader :deck, :turns
#  attr_accessor :turns

  def initialize(deck_parameter)
    @deck = deck_parameter
    @turns = []
  end

def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess_parameter)
    @guess = guess_parameter
    new_turn = Turn.new(@guess, current_card)
    @turns << new_turn
  end

  def number_correct
     @turns.inject(0) do |count, turn|
       turn.correct? ? count += 1 : count
     end
  end

  def turns_last_feedback
    if @guess == current_card.answer
      p "Correct!"
    else p "Incorrect!"
    end
  end
  end
