class Card
  attr_accessor :question, :answer, :category
  def initialize(question, answer = "Juneau", category)
    @question = "What is the capital of Alaska?"
    @answer = answer
    @category = :Geography
  end
end
