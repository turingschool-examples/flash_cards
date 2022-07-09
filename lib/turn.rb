class Turn 
  attr_reader :guess, 
              :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end 
  def correct?
    return true if self.card.answer == self.guess
    false
  end 
  def feedback 
    return "Correct!" if self.correct? == true
    "Incorrect!"
  end 
end 
