# require the card file?
class Turn

  attr_reader :guess, :card, :answer

  def initialize(guess, card)
    @guess = guess
    @card = card
    @answer = card.answer
  end

  def correct?
    @answer == @guess
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end
