#1 need to create a class called card. each card has 3 attributes: question, answer, category
#1 when i initialize it with card.new, I can input the info for the components
  #1.1 need to assign a variable for attribute 'question' (what's the cap of alaska)
  #1.2 need to assign a variable for attribute 'answer' (Juneau)
  #1.3 need to assign a variable for attribute 'category' (Geography)
class Card
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

#Without this portion, it gave me an error message that said 'undefined method'
  def question
    @question
  end

  def answer
    @answer
  end

  def category
    @category
  end
end


#2 need to create a class called turn
