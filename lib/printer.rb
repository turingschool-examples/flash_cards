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


  def card_message()
    card4_message = "This is card number 3 out of 4.
    Question: Which important person in history was recently
    unveiled as the new face of the 50 pound note in the UK?"
  end

 #  def card4_feedback
 #   return "Correct!" if user_input == "alan turing" || "Alan Turing"
 #   "Incorrect."
 # end

 def final_score_message
   "****** Game over! ******
   You had #{number_correct.to_i}% correct guesses out of 4 for a total score of #{percent_correct}.
   Arithmetic - #{percent_correct_by_category.to_i}% correct
   Animal Stuff - #{percent_correct_by_category.to_i}% correct
   History - #{percent_correct_by_category.to_i}% correct"
 end



end
