class Card
attr_reader :answer, :catagory, :question 
  def initialize(question, answer, catagory)
    @question = question
    @answer = answer
    @catagory = catagory
  end
end
