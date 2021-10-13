
class Turn
  attr_reader :guess, :card

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    if @guess == @card.answer
      return true
    else
      return false
    end
  end

  def feedback
    if self.correct?
      return 'Correct!'
    else
      return 'Incorrect.'
    end
  end

end
