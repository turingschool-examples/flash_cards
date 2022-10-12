class Turn
  attr_reader :guess,
              :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
   @guess == card.answer
  end

  def feedback
    if @guess == True
      p "Correct!"
    else
      p "Incorrect."
  end

end
