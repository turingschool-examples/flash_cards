require './lib/card'

class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def is_correct?
    if @guess == @card.answer
      true
    elsif @guess != @card.answer
      false
    end
  end

  def feedback
    if @guess == @card.answer
      "Correct!"
    elsif @guess != @card.answer
      "Incorrect."
    end
  end


end
