class Card
  attr_accessor :question,
                :answer,
                :catergory

  def initialize(question, answer, catergory)
    @question = question
    @answer = answer
    @catergory = catergory
  end

end
