require './lib/deck'
require './lib/turn'
require './lib/card'

class Round
  attr_reader :deck,
              :turns,
              :number_correct,
              :correct_cards,
              :used_deck
              :current_turn
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @current_turn = Turn.new(guess, current_card)
    if @current_turn.correct?
      @number_correct += 1
      @correct_guess = true
    end
    @turns << @current_turn
    @deck.cards.rotate!
    @current_turn
  end

  def total_by_category(category)
    category_total = @turns.find_all do |turn|
      turn.card.category == category
    end
    category_total.length
  end

  def number_correct_by_category(category)
    correct_by_category = @turns.find_all do |turn|
      turn.guess == turn.card.answer && turn.card.category == category
    end
    correct_by_category.length
  end

  def percent_correct
    (@number_correct.to_f / @turns.length.to_f) * 100
  end

  def percent_correct_by_category(category)
    correct = number_correct_by_category(category)
    total = total_by_category(category)
    percentage = ( correct.to_f / total.to_f ) *100
    percentage.round(1)
  end
end
