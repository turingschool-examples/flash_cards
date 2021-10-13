class Card
  attr_reader :question, :answer, :category

  def initialize(question_arg, answer_arg, category_arg)
    @question = question_arg
    @answer = answer_arg
    @category = category_arg
  end

end
