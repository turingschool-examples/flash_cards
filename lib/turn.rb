class Turn
  attr_reader :guess, :card

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    return true if @guess.downcase == @card.answer.downcase
    false
  end

  def feedback 
    return "Correct!" if correct?
    "Incorrect"
  end
end