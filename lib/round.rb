# frozen_string_literal: true

# Stores and performs actions on Deck Object, turns as array, and current card.
class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    @turns << turn
    @current_card = next_card
    turn
  end

  def current_index
    @deck.cards.index(@current_card)
  end

  def next_card
    next_index = current_index + 1
    @deck.cards[next_index]
  end

  def number_correct
    @turns.count { |turn| turn.correct? }
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.correct? if turn.card.category == category }
  end

  def percent_correct
    (number_correct.to_f / @turns.count) * 100.0
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / turns_by_category(category)) * 100.0
  end

  def turns_by_category(category)
    @turns.count { |turn| turn.card.category == category }
  end
end
