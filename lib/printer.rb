require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/game_flow'
require 'pry'

class Printer

  def welcome_message
    print1 =
    "Welcome! You're playing with 4 cards.

    -------------------------------------------------"

    puts print1
  end


  def card_message(card, turn_count)
    print2 = "This is card number #{turn_count} out of 4.
    Question: #{card.question}"

    puts print2
  end

  def feedback_message(guess, answer)
    if guess == answer
      puts "
      Correct!
      "
    else
      puts "
      Incorrect.
      "
    end
  end



 def final_score_message(number_correct, percent_correct)
   print3 = "****** Game over! ******

   You had #{number_correct.to_i} correct guesses out of 4 for a total score of #{percent_correct.to_i}%."

   puts print3
 end

 def final_score_by_category_message(category, percents)
   message =  "#{category} - #{percents.to_i}% correct"

   puts message
 end



end
