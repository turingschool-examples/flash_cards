require 'rspec'

class Card
  attr_reader :question, :answer, :category

  def initialize(question_param, answer_param, category_param)
    @question = question_param
    @answer = answer_param
    @category = category_param
    # keeping pry within the initialize method will allow
    # you to access the data within the method
    # require 'pry'; binding.pry
  end
end
