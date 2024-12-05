# frozen_string_literal: true

require_relative 'turn'
# Where the main game is played. Starts with a deck, tracks statistics.
class Round
  attr_reader :deck, :turns, :number_correct, :deck_index

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
    # The count method will only count the turns where the category matches and the answer was correct
    @turns.count { |turn| turn.correct? && turn.card.category == category }
  end

  def percent_correct
    @number_correct / @turns.size.to_f * 100
  end

  def percent_correct_by_category(category)
    # There's a bit to unpack here. The numerator calls the number_correct_by_category method from earlier in this class.
    # The denominator is similar to that method, without the requirement that the answer was correct.
    # The to_f method converts the integer to a float so we don't get any weird effects from integer division.
    # Lastly, we multiply by 100 to return a percentage
    number_correct_by_category(category) / @turns.count { |turn| turn.card.category == category }.to_f * 100
  end
end
