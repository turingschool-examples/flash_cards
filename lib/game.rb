require 'rspec'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Game
  attr_reader :round

  def initialize(round)
    @round = round
  end

  def welcome
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

    puts "Welcome #{name}! You're playing with #{@round.deck.cards.length} cards."
    puts "-------------------------------------------------"
    puts "This is card number #{@round.turns.size + 1} out of #{@round.deck.cards.length}."
    puts "Question: #{@round.current_card.question}"
    guess = gets.chomp
    #Check guess - if guess == answer, return correct. else return incorrect
    
    # @turn.feedback
  
    #loop back to line 29
    # if @deck.length == 0
    #   end_game
    # end
  end 

  def end_game
                                                                                          
    p "     _/_/_/    _/_/    _/      _/  _/_/_/_/        _/_/    _/      _/  _/_/_/_/  _/_/_/    "
    p "  _/        _/    _/  _/_/  _/_/  _/            _/    _/  _/      _/  _/        _/    _/  " 
    p " _/  _/_/  _/_/_/_/  _/  _/  _/  _/_/_/        _/    _/  _/      _/  _/_/_/    _/_/_/    "  
    p "_/    _/  _/    _/  _/      _/  _/            _/    _/    _/  _/    _/        _/    _/  "   
    p " _/_/_/  _/    _/  _/      _/  _/_/_/_/        _/_/        _/      _/_/_/_/  _/    _/  "
    p "You had #{round.number_correct} correct guesses out of #{round.turns.length} for a total score of #{round.percent_correct}."
    p "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
    p "Turing Staff - #{round.percent_correct_by_category(:TuringStaff)}% correct"
    p "Pop Culture - #{round.percent_correct_by_category(:PopCulture)}% correct"
  end 
end 
