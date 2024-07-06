require './lib/card'

class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
    @question = @card.question
    @answer = @card.answer
    @category = @card.category
  end

  def correct?
    # return true if @guess = @answer
    return true if @guess = @card.answer
    false
  end

  def feedback
    if @guess == @answer
        "Correct!"
    else
        "Incorrect."
  end
end  
end