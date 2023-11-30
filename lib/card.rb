class Card
  attr_reader :question,
              :answer, 
              :category

  def initialize(question, answer, category = :Geography)
    @question = question
    @answer = answer
    @category = category
  end

end