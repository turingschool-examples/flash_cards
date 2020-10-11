class Turn
  attr_reader :guess,
              :card

  def initiazlie(guess, card)
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
