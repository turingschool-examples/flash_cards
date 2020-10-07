class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess.capitalize
    @card = card
  end

  def correct?
    @card.answer == @guess
  end

  def feedback
    if correct?
      return "Correct!"
    else
      return "Incorrect!"
    end
  end
end
