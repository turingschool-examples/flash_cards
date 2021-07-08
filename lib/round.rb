require './lib/deck'

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
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn

    new_turn
  end

  def number_correct
    @turns.count { |turn| turn.correct? }
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.correct? && turn.card.category == category
    end
  end

  def percent_correct
    (number_correct.fdiv(@turns.size) * 100).round
  end

  def percent_correct_by_category(category)
    category_correct = number_correct_by_category(category)
    
    (category_correct.fdiv(category_size(category)) * 100).round
  end

  def category_size(category)
    @turns.count { |turn| turn.card.category == category }
  end
end
