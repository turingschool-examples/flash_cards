require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    new_turn
  end

  def count
    @turns.count
  end

  def number_correct
    @turns.find_all do |turn|
      turn.correct? == true
    end.count
  end

  def number_correct_by_category(category) #add rounding
    @turns.find_all do |turn|
      turn.correct? == true && turn.card.category == category
    end.count
  end

  def percent_correct
    (number_correct.to_f / @turns.count) * 100
  end

  def percent_correct_by_category(category)
    category = @deck.cards_in_category(category)
    correct = number_correct_by_category(category).count
    (correct.to_f / category.to_f) * 100
  end

end
