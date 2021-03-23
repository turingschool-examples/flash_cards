class Turn
  attr_reader :guess,
                  :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    card.answer == @guess
  end

  def feedback
    return "Correct!" if correct? == true
      "Incorrect."
  end
end
