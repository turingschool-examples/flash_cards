class Card
attr_reader :question, :answer, :category
def initialize(question_param, answer_param, category_param)
  @question= question_param
  @answer= answer_param
  @category= category_param
  end
  #require "pry"; binding.pry 
end
