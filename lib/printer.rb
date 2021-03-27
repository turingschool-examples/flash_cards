require 'pry'

class Printer

  def welcome_message
    welcome_message =
    "Welcome! You're playing with 4 cards.

    -------------------------------------------------"
    puts welcome_message
  end

  def card1_message
    card1_message =
    "This is card number 1 out of 4.
    Question: What is 5 + 5?"
    puts card1_message
  end

  # def card_1_feedback
  #   return "Correct!" if user_input == 10
  #   "Incorrect."
  # end

  def card2_message
    card2_message = "This is card number 2 out of 4.
    Question: What is Joanna's favorite animal?"
    puts card2_message
  end

  # def card2_feedback
  #   return "Correct!" if user_input == "cheetah" || "Cheetah"
  #   "Incorrect."
  # end

  def card3_message
    card3_message = "This is card number 3 out of 4.
    Question: What is the name of Megan's doggo?"
    puts card3_message
  end

  # def card3_feedback
  #   return "Correct!" if user_input == "nile" || "Nile"
  #   "Incorrect."
  # end

  def card4_message
    card4_message = "This is card number 3 out of 4.
    Question: Which important person in history was recently
    unveiled as the new face of the 50 pound note in the UK?"
    puts card4_message
  end

 #  def card3_feedback
 #   return "Correct!" if user_input == "alan turing" || "Alan Turing"
 #   "Incorrect."
 # end



end

printer = Printer.new
printer.welcome_message

printer.card1_message

printer.card2_message

printer.card3_message

printer.card4_message
