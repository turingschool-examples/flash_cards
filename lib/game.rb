require 'rspec'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Game
  attr_reader :round

  def initialize(round)
    @round = round
  end

  def start
    puts ""
    puts "Welcome to"
    puts ""
    #ASCII LEAN FONT
    puts "    _/_/_/_/  _/          _/_/      _/_/_/  _/    _/    _/_/_/    _/_/    _/_/_/    _/_/_/      _/_/_/   "
    puts "   _/        _/        _/    _/  _/        _/    _/  _/        _/    _/  _/    _/  _/    _/  _/          "
    puts "  _/_/_/    _/        _/_/_/_/    _/_/    _/_/_/_/  _/        _/_/_/_/  _/_/_/    _/    _/    _/_/       "
    puts " _/        _/        _/    _/        _/  _/    _/  _/        _/    _/  _/    _/  _/    _/        _/      "
    puts "_/        _/_/_/_/  _/    _/  _/_/_/    _/    _/    _/_/_/  _/    _/  _/    _/  _/_/_/    _/_/_/         "
    puts ""                                                                                                                               
    puts "Please enter your name"
    name = gets.chomp

    puts "Welcome #{name}! You're playing with #{round.deck.cards.length} cards."
    puts "-------------------------------------------------"
    
    round_number = 1
    until (round_number - 1) == round.deck.cards.size
      round.deck.cards.each do |card|
        puts "This is card number #{round_number} out of #{round.deck.cards.length}."
        puts "Question: #{round.current_card.question}"
        guess = gets.chomp
        turn = round.take_turn(guess)
        puts turn.feedback
        round_number += 1
      end
      end_game
    end
  end

  def end_game
                                                                                          
    puts "     _/_/_/    _/_/    _/      _/  _/_/_/_/        _/_/    _/      _/  _/_/_/_/  _/_/_/    "
    puts "  _/        _/    _/  _/_/  _/_/  _/            _/    _/  _/      _/  _/        _/    _/  " 
    puts " _/  _/_/  _/_/_/_/  _/  _/  _/  _/_/_/        _/    _/  _/      _/  _/_/_/    _/_/_/    "  
    puts "_/    _/  _/    _/  _/      _/  _/            _/    _/    _/  _/    _/        _/    _/  "   
    puts " _/_/_/  _/    _/  _/      _/  _/_/_/_/        _/_/        _/      _/_/_/_/  _/    _/  "
    puts "You had #{round.number_correct} correct guesses out of #{round.turns.length} for a total score of #{round.percent_correct}."
    puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
    puts "Turing Staff - #{round.percent_correct_by_category(:TuringStaff)}% correct"
    puts "Pop Culture - #{round.percent_correct_by_category(:PopCulture)}% correct"
   
  end 
end 
