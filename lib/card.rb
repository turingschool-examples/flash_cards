class Card
  attr_reader :question,
                :answer,
                :catergory

  def initialize(question, answer, catergory)
    @question = question
    @answer = answer
    @catergory = catergory
  end

end
