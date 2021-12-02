require './lib/card'



class Turn

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def card
    return @card

  end

  def guess
    return @guess
  end

  def correct?
    card.answer == @guess
  end

  def feedback
    if card.answer == @guess
      return "Correct!"
    else
      return "Incorrect."
    end
  end


end
