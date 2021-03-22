class Card
  attr_accessor :question, :answer, :catergory

  def intialize(question, answer, catergory)
    @question = question
    @answer = answer
    @catergory = catergory
  end
end
