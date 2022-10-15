class Turn
  attr_reader :guess, :card

  def initialize(card, guess)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == card.answer.downcase
  end

  def feedback
    if correct?
      'Correct!'
    else
      'Incorrect.'
    end
  end
end