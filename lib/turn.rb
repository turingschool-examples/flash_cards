class Turn
  attr_reader :card, :guess

  def initialize(card, guess)
    @card = card
    @guess = guess.downcase
  
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