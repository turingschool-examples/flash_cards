require 'card'

class Turn
  attr_reader :guess, :card, :is_correct
  def initialize(guess, card)
    @guess = guess
    @card = card
    @is_correct = guess == @card.answer
  end

  def guess()
    @guess
  end

  def card()
    @card
  end

  def correct?()
    @is_correct
  end

  def feedback()
    if is_correct
      return "Correct!"
    else
      return "Incorrect."
    end
  end

end
