require 'set'
require_relative 'helper'

class Round
  attr_reader :deck, :turns

  @@rounds = Set.new

  def initialize(deck)
    @deck = deck
    @turn_count = 0
    @turns = []
    @@rounds << self
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @turn_count += 1
    @turns.push(Turn.new(guess, current_card))
    check_guess
  end

  def check_guess
    @turns.last.correct?
  end

  def turn_feedback
    @turns.last.feedback
  end

  def card_complete
    @deck.cards.rotate
  end

  def number_correct
    @turns.count {|turn| turn.card.answer == turn.guess}
  end

  def number_incorrect
    @turns.count {|turn| turn.card.answer != turn.guess}
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.card.answer == turn.guess && turn.card.category == category
    end
  end

  def percent_correct
    100 * (number_correct / @turns.count)
    rescue ZeroDivisionError
    0.0
  end

  def percent_correct_by_category(category)
    100 * (number_correct_by_category(category) / @turns.count)
    rescue ZeroDivisionError
    0.0
  end
end
