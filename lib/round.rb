

require './lib/turn'
require './lib/deck'
require './lib/card'

class Round
  attr_reader :deck, :turns, :current_card, :number_correct
  
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards.first
    @number_correct = 0
  end

  def take_turn(guess)
    turn = Turn.new(current_card, guess)
    @turns << turn
    @number_correct += 1 if turn.correct?
    @current_card = deck.cards[@turns.count]
    turn
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.card.category == category && turn.correct? }
  end

  def percent_correct
    (@number_correct.to_f / @turns.count * 100).round(1)
  end

  def percent_correct_by_category(category)
    total_in_category = @turns.count { |turn| turn.card.category == category }
    correct_in_category = number_correct_by_category(category)
    return 0.0 if total_in_category == 0
    (correct_in_category.to_f / total_in_category * 100).round(1)
  end

  def start
        puts "Welcome! You are playing with #{deck.cards.count} cards."
        puts "-------------------------------------------------"

  @deck.cards.each_with_index do |card, index|    
        puts "This is card number #{index + 1} out of #{deck.cards.count}."
        puts "Question: #{card.question}"
        guess = gets.chomp
        #require 'pry'; binding.pry
        turn = take_turn(guess)
        puts turn.feedback
    end
     
     puts "** Game over! **"
     puts "You had #{number_correct} correct guesses out of #{deck.cards.count} for a total score of #{percent_correct}%."
     categories = deck.cards.map { |card| card.category }.uniq
     categories.each do |category|
       puts "#{category} - #{percent_correct_by_category(category)}% correct"
     end
    end
 end
