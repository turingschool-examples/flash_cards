class Card
  attr_accessor :category, :answer, :question
  
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end
