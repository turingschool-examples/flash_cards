#create class Card
class Card
  # initialize variables with read funcationality
  attr_reader :question,
                :answer,
                :category

  # initialize class
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end



end
