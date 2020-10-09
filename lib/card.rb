require 'pry'
class Card
  attr_reader :question, :answer, :category
  def initialize(question, answer, category)
    @question = question
    @answer = answer.upcase
    @category = category
  end
end
