require 'pry'

class Printer

  def welcome_message
    welcome_message =
    "    Welcome! You're playing with 4 cards.

    -------------------------------------------------

    This is card number 1 out of 4.
    Question: What is 5 + 5?"
    puts welcome_message
  end


end

printer = Printer.new
printer.welcome_message
