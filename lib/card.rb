class Card
  attr_reader :question, :answer, :category
  def initialize(new_question, new_answer, new_category)
    @question = new_question
    @answer = new_answer
    @category = new_category
  end
end
