
class Turn
attr_reader :guess, :card, :category, :question


  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if card.answer == @guess
      return true
    else
      return false
    end
  end

def feedback
  if card.answer == @guess
    "Correct!"
  else
    "Incorrect."
  end
end

end
