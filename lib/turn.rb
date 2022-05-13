class Turn
  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    return guess.downcase == card.answer.downcase
  end

  def feedback
    if correct?
      return 'Correct!'
    else
      return 'Incorrect.'
    end
  end
end
