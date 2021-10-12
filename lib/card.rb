


class Card
  def initialize(question_param, answer_param, category_param)
    @question = question_param
    @answer = answer_param
    @category = category_param
  end

  def question
    @question
  end

  def answer
    @answer
  end

  def category
    @category
  end
end

require 'pry'; binding.pry
