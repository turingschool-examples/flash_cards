class Turn

  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    return true if self.guess == card.answer
    return false if self.guess != card.answer
  end

  def feedback
    return "Correct!" if self.correct? == true
    return "Incorrect." if self.correct? == false
  end 


end
