require './lib/card.rb'

class Turn
  attr_reader :guess,
              :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
     guess == answer
  end

   def feedback
     if guess == answer
       "Correct!"
     else
       "Incorrect!"
     end
  end
end
