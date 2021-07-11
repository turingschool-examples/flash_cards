require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Game
  attr_reader :round, :counter
  def initialize(round)
    @round = round
    @counter = counter
  end
  def start

    puts "Welcome! you're playing with #{round.deck.count} cards"
    puts '-'*45
    until round.deck.count == 0
    puts "This is card #{round.turns.count+1} out of 4 "
    puts "Question: #{round.current_card.question}"
     # new_guess= round.take_turn(gets.chomp)
    # if new_guess == round.current_card.answer.correct?
      guess = gets.chomp
     round.take_turn(guess)
     puts round.turns.last.feedback

  #   if gets.chomp == round.current_card.answer
  #     round.take_turn(gets.chomp)
  #     puts "Correct!"
  #   else
  #     round.take_turn(gets.chomp)
  #   puts "Incorrect!"
  # end
end
puts "****** Game over! ******
You had  #{round.number_correct} correct guesses out of #{round.deck.count+4} for a total score of #{round.percent_correct}%"
each_category = round.turns.map do |turn|
  turn.card.category

end
 each_category.uniq.each do |category|
   puts "#{category}  - #{round.percent_correct_by_category(category)}% correct"
 end

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
