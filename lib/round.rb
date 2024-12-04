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
    # Add one to the deck_index to move to the next card
    @deck_index += 1
    # Return new_turn, instead of returning the deck index
    new_turn
  end

  def number_correct_by_category(category)
    # Create a new array of correct answers that match the category
    counter_array = @turns.select do |turn|
      turn.correct? && turn.card.category == category
    end
    # Return the size of that array
    counter_array.count
  end
end
