# frozen_string_literal: true

require_relative 'turn'
# Where the main game is played. Starts with a deck, tracks statistics.
class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.size]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @turns.last
  end

  def number_correct
    @turns.count(&:correct?)
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.correct? && turn.card.category == category }
  end

  def percent_correct
    number_correct / @turns.size.to_f * 100
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category) / @turns.count { |turn| turn.card.category == category }.to_f * 100
  end
end
