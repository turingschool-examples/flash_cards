class Card
  attr_accessor :answer, :category
  attr_reader :question
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end
