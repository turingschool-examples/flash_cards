# require 'pry'
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

  def initialize(guess, card)
    @guess = guess
    @card = card
  end 

  def correct? 
    if @guess == @card.answer
      true
    else 
      false
    end
  end

end

# binding.pry