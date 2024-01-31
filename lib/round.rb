require './lib/card'
require './lib/turn'
require './lib/deck'

# Documentation for class Round
class Round
  attr_reader :deck, :turns, :turn, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn = 0
    @guess = nil
    @number_correct = 0
  end

  def current_card
    @deck.cards[@turn]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    turns.push(turn)
    @guess = guess
    @turn += 1
    @number_correct += 1 if guess == turn.answer
    turn
  end

  def correct?
    if @guess == current_card.answer
      true
    elsif @guess.nil?
      nil
    else
      false
    end
  end

  def number_correct_by_category(category)
    count_correct = 0
    @turns.each do |turn|
      count_correct += 1 if turn.category == category && turn.guess == turn.answer
    end
    count_correct
  end

  def percent_correct_by_category(category)
    count_category = 0
    @turns.each do |turn|
      count_category += 1 if turn.category == category
    end
    fraction_correct = number_correct_by_category(category).to_f / count_category
    (fraction_correct * 100.0).round(1)
  end
end
