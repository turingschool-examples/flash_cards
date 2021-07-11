require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Game
  attr_reader :round
  def initialize(round)
    @round = round
  end
  def start

    puts "Welcome! you're playing with #{round.deck.count} cards"
    puts '-'*45
    until round.deck.count == 0
    puts "This is card #{round.turns.count+1} out of 4 "
    puts "Question: #{round.current_card.question}"
     # new_guess= round.take_turn(gets.chomp)
    # if new_guess == round.current_card.answer.correct?
    if gets.chomp == round.current_card.answer
      round.take_turn(gets.chomp)
      puts "Correct!"
    else
      round.take_turn(gets.chomp)
    puts "Incorrect!"
  end
end
puts "****** Game over! ******
You had correct guesses out of #{round.deck.count+4}"
end
# end
  # def draw_card
  #   new_guess= gets.chomp
  #   if new_guess == round.current_card.answer
  #     puts "Correct!"
  #   else
  #   puts "Incorrect!"
  #   end
  # end
end
