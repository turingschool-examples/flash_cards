class Card
  attr_reader :question,
              :answer,
              :category

  def initialize(question, answer, category)
    @question = question
    @answer   = answer
    @category = category.to_sym
  end
end
