# Documentation for class Turn
class Turn
  attr_reader :card, :guess, :question, :answer, :category

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    if @guess.downcase == @card.answer.downcase
      'Correct!'
    else
      "Incorrect. The correct answer is #{@card.answer}"
    end
  end
end
