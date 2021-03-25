class Turn

  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    return true if guess == card.answer
    return false if guess != card.answer
  end

  def feedback
    return "Correct!" if correct? == true
    return "Incorrect." if correct? == false
  end


end
