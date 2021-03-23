class Turn

  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    return true if @guess == @card.answer
    false
  end

  def feedback
    return "Correct!" if correct? == true
    return "Incorrect."
    # if correct? == true
    #   return "Correct!"
    # elsif correct? == false
    #   return "Incorrect."
    # end
  end

end
