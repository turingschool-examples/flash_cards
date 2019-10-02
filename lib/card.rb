#Class: Card
#Object: FlashCard
#Attributes: Question (string), Answer (string), Catagory (array)

class Card
  attr_holder :question, :answer, :catagory

  def initialize (question, answer, catagory)
    @question = question
    @answer = answer
    @catagory = catagory
  end

end
