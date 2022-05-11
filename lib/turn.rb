class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    return guess == card.answer
  end

  def feedback
    if correct? == true
      return "Correct!"

    if correct? == false
      return "Incorrect."
  end



end
