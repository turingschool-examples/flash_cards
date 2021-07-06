class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

end

class Turn
  attr_reader :guess, :card

  def initialize (guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == @card.answer
  end

  def feedback

    if @guess == @card.answer
      return "Correct!"
    else
      return "incorrect."
    end
  end


end


require "pry"; binding.pry
