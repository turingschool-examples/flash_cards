require_relative './lib/round.rb'
require_relative './lib/deck.rb'
require_relative './lib/card.rb'
require_relative './lib/turn.rb'

@card1 = Card.new("In what year did the United States of America declare independence from Great Britain?", "1776", :History)

puts "Welcome! You're playing with 4 cards.
      -------------------------------------------------
      This is card number 1 out of 4.
      Question: What is 5 + 5?"

user_answer_1 = gets.chomp

  if user_answer_1 == 10
    puts "Correct!
    This is card number 2 out of 4.
    Question: What is Rachel's favorite animal?"
  else
    puts "Incorrect.
    This is card number 2 out of 4.
    Question: What is Rachel's favorite animal?"
  end

# user_answer_2 = gets.chomp
#
#   if user_answer_2 == 10
#     puts "Correct!
#     This is card number 2 out of 4.
#     Question: What is Rachel's favorite animal?"
#   else
#     puts "Incorrect.
#     This is card number 2 out of 4.
#     Question: What is Rachel's favorite animal?"
#   end
