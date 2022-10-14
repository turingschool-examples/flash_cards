class Turn
  attr_reader :guess,
              :card,
              :answer
  def initialize(guess, card)
    @guess = guess
    @card = card
  end
  
  def correct?
    if card.answer == self.guess
      return true
    elsif self.answer == self.guess
      return true
      
    else false
    end
  end
  
  def feedback
    if self.correct?
      return "Correct!"
    else
      "Incorrect!"
    end
  end
end