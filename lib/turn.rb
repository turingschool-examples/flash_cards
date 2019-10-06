class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if card.answer == @guess
      return true
    end
  end

  def feedback
    if correct? == true
      p "Correct!"
    else
      p "Incorrect."
    end
  end

end
