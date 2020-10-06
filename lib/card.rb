class Card
  attr_reader :question, :answer, :category
   def initialize(question, answer, catogory)
     @question = question
     @answer = answer
     @category = catogory
  end
 end
