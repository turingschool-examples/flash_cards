class Turn
  attr_reader :guess,
              :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess.capitalize == @card.answer.capitalize
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end
end
