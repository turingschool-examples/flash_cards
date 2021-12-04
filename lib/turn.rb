require 'pry'
class Turn
  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card   = card
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def correct?
    @guess == card.answer
  end

  def feedback
# binding.pry
    if correct? == true

      feedback = "Correct!"
    else

      feedback = "Incorrect."
    end
    return feedback
  end
end
