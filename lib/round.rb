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
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @number_correct += 1 if new_turn.correct?
    @deck_index += 1
    new_turn
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.correct? && turn.card.category == category }
  end

  def percent_correct
    @number_correct / @turns.size.to_f * 100
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category) / @turns.count { |turn| turn.card.category == category }.to_f * 100
  end
end
