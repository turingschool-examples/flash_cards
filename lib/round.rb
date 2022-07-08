require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_accessor :turns, :deck, :current_card, :number_correct, :correct_turns

  def initialize(deck)
    @deck = deck
    @current_card = deck.cards[0]
    @turns = []
    @correct_turns = []
  end

  def take_turn(string_as_guess)
    new_turn = Turn.new(string_as_guess, current_card)
    @turns << new_turn
    @current_card = deck.cards.rotate![0]
    @correct_turns << new_turn if new_turn.correct?
    new_turn
  end

  def number_correct
    turns.select { |turn| turn.correct? }.size
  end

  def number_correct_by_category(category)
    turns.select { |turn| turn.correct? && turn.card.category == category}.size
  end

  def percent_correct
    ((turns.select { |turn| turn.correct? }.size).to_f / (turns.size)*100).round(1)
  end

  def percent_correct_by_category(category)
    ((turns.select { |turn| turn.correct? && turn.card.category == category}.size).to_f /
    (correct_turns.select { |turn| turn.card.category == category}.size)*100).round(1)
  end

  def start
    puts "Welcome! You're playing with 4 cards.
-------------------------------------------------
This is card number 1 out of 3.
Question: What is the capital of Alaska?"
  end

  def show_card(user_guess)
      take_turn(user_guess)
      turns[0].feedback
      puts "This is card number #{(turns.size + 1)} out of 3."
    if turns.size == deck.cards.size
      puts "****** Game over! ******
        You had #{correct_turns.size} correct guesses out of 3 for a total score of #{percent_correct}%.
        STEM - #{percent_correct_by_category(:STEM)}% correct
        Geography - #{percent_correct_by_category(:Geography)}% correct
        Pop Culture - 0% correct"
    else
      puts "Question: #{current_card.question}"
    end
  end



end
