require './lib/turn'

class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards.first
    @number_correct = 0
  end

  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    @turns << turn
    @number_correct += 1 if turn.correct?
    @current_card = @deck.cards[@turns.count]
    turn
  end

  def number_correct
    @number_correct
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.correct? && turn.card.category == category }
  end

  def percent_correct
    (@number_correct.to_f / @turns.count) * 100
  end

  def percent_correct_by_category(category)
    total_in_category = @turns.count { |turn| turn.card.category == category }
    correct_in_category = number_correct_by_category(category)
    (correct_in_category.to_f / total_in_category) * 100
  end
end