#Class: Turn
#Object: turn
#Methods: initialize(string, card), guess (returns the guess), card(returns the card),
# correct? (boolean), feedback (return correct or incorrect)

class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @card.answer == @guess
      return true
    else
      return false
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
