require './lib/card'
require './lib/turn'
require './lib/deck'

# A class that provides functionality for the flash cards game.
# It is instantiated from a Deck instance, and has methods to
# compare guesses with answers, count the number of correct answers
# by cateogory, and display the current card.
# Syntax:
# round = Round.new(deck)
class Round
  attr_reader :deck, :turns, :turn_number, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_number = 0
    @number_correct = 0
  end

  def current_card
    @deck.cards[@turn_number]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    turns.push(turn)
    @turn_number += 1
    @number_correct += 1 if guess == turn.card.answer
    turn
  end

  def correct?
    @turns.last.guess == current_card.answer
  end

  def number_correct_by_category(category)
    count_correct = 0
    @turns.each do |turn|
      count_correct += 1 if turn.card.category == category && turn.guess == turn.card.answer
    end
    count_correct
  end

  def percent_correct_by_category(category)
    count_category = 0
    @turns.each do |turn|
      count_category += 1 if turn.card.category == category
    end
    fraction_correct = number_correct_by_category(category).to_f / count_category
    (fraction_correct * 100.0).round(1)
  end
end
