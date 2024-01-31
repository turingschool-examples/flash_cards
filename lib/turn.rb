# Documentation for class Turn
class Turn
  attr_reader :card, :guess, :question, :answer, :category

  def initialize(guess, card)
    @guess = guess
    @card = card
    @question = @card.question
    @answer = @card.answer
    @category = @card.category
  end

  def correct?
    @guess == @answer
  end

  def feedback
    if @guess.downcase == @answer.downcase
      'Correct!'
    else
      "Incorrect. The correct answer is #{@answer}"
    end
  end
end
