class Card
  attr_reader :question, :answer, :category
#set the initial values for an object
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end
