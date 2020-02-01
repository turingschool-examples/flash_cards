class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess.upcase == card.answer.upcase
      true
    else
      false
    end
  end

  def feedback
    if @guess.upcase == card.answer.upcase
      p "Correct!"
    else
      p "Incorrect."
    end
  end
end
