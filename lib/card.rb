class Card
  attr_reader :question, :category
  attr_accessor :answer
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end
