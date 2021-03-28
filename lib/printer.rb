require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

class Printer

  def welcome_message
    welcome =
    "Welcome! You're playing with 4 cards.

    -------------------------------------------------"

    puts welcome
  end


  def card_message(card, turn_count)
    message = "This is card number #{turn_count} out of 4.
    Question: #{card.question}"

    puts message
  end

  def feedback_message(user_input, answer)
   return "Correct!" if @user_input == @round.current_card.answer #|| "Alan Turing"
   # binding.pry
   @guess == @card.answer

   "Incorrect."

 end

 def final_score_message
   "****** Game over! ******
   You had #{number_correct.to_i}% correct guesses out of 4 for a total score of #{percent_correct}.
   Arithmetic - #{percent_correct_by_category.to_i}% correct
   Animal Stuff - #{percent_correct_by_category.to_i}% correct
   History - #{percent_correct_by_category.to_i}% correct"
 end



end
