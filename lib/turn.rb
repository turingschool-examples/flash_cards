class Turn
  attr_reader :guess,
              :card

  def initialize(guess, card)
    @card  = card
    @guess = guess
  end

def correct?
    return true if card.answer.upcase.include?(guess.upcase) && guess != ""
    false
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect"
    end
  end
end
