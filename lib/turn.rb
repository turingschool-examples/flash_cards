require 'pry'
require './lib/card'

class Turn
  atttr_reader :guess, :card, :answer

  def initalize(guess, card, answer)
    @guess = guess
    @card = card
    @answer = answer

  print @card

  @user_answer = user_answer
  user_answer = gets

    @user_answer.downcase == @answer.downcase


      if true print @user_answer.chop + " is Correct!"

      else print "Incorrect"


  end
end
end
