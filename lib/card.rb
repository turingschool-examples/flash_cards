#Class: Card
#Object: card
#Attributes: Question (string), Answer (string), Catagory (array)

class Card
  attr_reader :question, :answer, :category

  def initialize (question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

end
