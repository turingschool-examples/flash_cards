class Turn
  attr_reader :guess,
              :card

  def initialize(guess, card)
    @card  = card
    @guess = guess
  end

def correct?
    return true if card.answer.upcase == (guess.upcase) && guess != ""
    false
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect! the correct answer is: #{@card.answer}"
    end
  end
end
