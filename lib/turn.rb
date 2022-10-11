require './lib/card'

class Turn

  attr_reader :guess, :card


  def initialize(string, card)
    @guess = string
    @card = card
  end


  def correct?
    if (@guess == @card.answer)
      return true
    end

    return false
  end


  def feedback
    if self.correct?
      return "Correct!"
    end

    return "Incorrect."
  end


end
