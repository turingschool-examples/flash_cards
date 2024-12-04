# frozen_string_literal: true

require_relative 'turn'
# Where the main game is played. Starts with a deck, tracks statistics.
class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @deck_index = 0
    @number_correct = 0
  end

  def current_card
    @deck.cards[@deck_index]
  end

  def take_turn(guess)
    # Create a new turn with the guess and current card, store it in the variable new_turn
    new_turn = Turn.new(guess, current_card)
    # Add new_turn to the turns array
    @turns << new_turn
    # Add one to the number_correct counter if it was correct
    @number_correct += 1 if new_turn.correct?
    # Return new_turn, instead of returning the turns array
    new_turn
  end
end
