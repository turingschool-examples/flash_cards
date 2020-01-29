class Card

  attr_accessor :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end



class Turn
  def initialize(guess, answer)
    @guess = guess
    @answer = answer
  end
  def correct?
    if @guess = card.answer
      puts "You are correct!"
    else
      puts "That is not the right answer."
    end
  end
end







#card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#puts card.answer
#puts card.category
