require './lib/turn'

class Round
  attr_reader :deck,
              :turns

  attr_accessor :take_turn

  def initialize(deck)
    @deck            = deck
    @turns           = []
  end

  def current_card
    @deck.cards[@turns.size]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    @turns.count(&:correct?)
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.correct? if turn.card.category == category
    end
  end

  def percent_correct
    number_correct.fdiv(@turns.count) * 100
  end

  def category_total(category)
    @turns.count do |turn|
      turn.card.category == category
    end
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category).fdiv(category_total(category)) * 100
  end
end
