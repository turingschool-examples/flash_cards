class Card
  attr_accessor :answer
  attr_reader :question, :category
  def initialize(question, answer, category)

    @question = question
    @answer = answer
    @category = category

  end
end
