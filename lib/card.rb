class Card
  attr_reader :question,
              :answer,
              :catagory

  def initialize(question, answer, catagory)
    @question = question
    @answer = answer
    @catagory = catagory
  end
end
