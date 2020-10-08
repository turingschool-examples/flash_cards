require './lib/card'

class Turn #redoing everything with what I learned today

  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    is_correct = false
    if @guess == card.answer
    is_correct = true
    return is_correct
    else false
    end
  end

  def feedback
    if @guess == card.answer
    return  "Correct!"
    else
    return  "Incorrect."
    end
  end
end
