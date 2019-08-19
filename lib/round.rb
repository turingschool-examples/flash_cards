require './lib/turn'
require 'pry'

class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def start
    puts "Welcome! You're playing with #{deck.cards.count} cards"
    puts "------------------------------------"
    puts ""
  end

  def current_card
    @deck.cards[0]
  end

  def record_guess(turn)
    if turn.correct?
      @number_correct += 1
    end
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns << new_turn
    @deck.cards.shift
    record_guess(new_turn)
    new_turn
  end

  def percent_correct
    (@number_correct.to_f / @turns.count.to_f) * 100
  end

  def number_correct_by_category(category)
    turns_correct = @turns.find_all do |turn|
      turn.card.category == category.to_sym && turn.guess == turn.card.answer
    end

    turns_correct.count
  end

  def percent_correct_by_category(category)
    turns_correct = number_correct_by_category(category)
    num_of_category = @turns.find_all do |turn|
      turn.card.category == category.to_sym
    end

    (turns_correct.to_f / num_of_category.count.to_f) * 100
  end
end
