require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

class Printer

  def welcome_message
    message =
    "Welcome! You're playing with 4 cards.

    -------------------------------------------------"
    puts message
  end

  def card_message(card, turn_count)
    message = "This is card number #{turn_count} out of 4.
    Question: #{card.question}"
    puts message
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
   message = "****** Game over! ******

   You had #{number_correct.to_i} correct guesses out of 4 for a total score of #{percent_correct.to_i}%."
   puts message
 end

 def final_score_by_category_message(category, percents)
   message =  "#{category} - #{percents.to_i}% correct"
   puts message
 end
end
