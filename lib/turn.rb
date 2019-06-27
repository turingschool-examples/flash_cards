class Turn
  attr_reader :card, :guess

  def initialize(guess, card)
    @card = card
    @guess = guess
  end

  def correct?
    @guess == card.answer
  end

  def feedback
    if correct?
      p "Correct!"
    else
      p "Incorrect."
    end
  end
end
