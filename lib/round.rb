require_relative 'card'
require_relative 'deck'
require_relative 'turn'

class Round
  attr_reader :deck, :turns, :attempt, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @attempt = attempt
    @number_correct = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @attempt = Turn.new(guess, deck.cards.first)
    @turns << @attempt
    @attempt.guess == @attempt.card.answer ? @number_correct += 1 : @number_correct
    @deck.cards.rotate!(1)
    @attempt
  end

  def number_correct_by_category(category)
    total_questions = []
    total_correct = []
    total_questions << @turns.each { |turn| turn.card.category == category ? total_questions << turn : turn }
    total_correct << @turns.each { |turn| turn.card.category == category && turn.guess == turn.card.answer ? total_correct << turn : turn }
    (total_correct.length / total_questions.length.to_f).round(2) * 100
  end

  def percent_correct
    (@number_correct.to_i / @turns.length.to_f).round(2) * 100
  end
end

#require 'pry'; binding.pry
