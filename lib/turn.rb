class Turn 
  attr_reader :string, :card
  def initialize(string, card)
    @string = string
    @card = card
  end 
  def guess
    @string 
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
