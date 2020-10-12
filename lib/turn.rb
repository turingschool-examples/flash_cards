class Turn
  attr_reader :answer, :card

  def initialize(answer, card)
    @answer = answer.upcase
    @card = card
  end

  def correct?
    @card.answer == @answer
  end

  def feedback
    if correct?
      return "Correct!"
    else
      return "Incorrect!"
    end
  end
end
