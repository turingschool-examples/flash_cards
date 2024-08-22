class Turn
  attr_reader 
  def initialize(guess,card)
    @guess = guess
    @card = card
  end
  def guess
    @guess
  end
  def card
    @card
  end
  def correct?
    @card.answer == @guess
    #downcase these to make them case insensitive
  end
  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end