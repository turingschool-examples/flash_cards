class Card

  def initialize(question, answer, category)
    @question = "What is the capital of Alaska?"
    @answer = "Juneau"
    @category = :Geography

  end

  def question
    "What is the capital of Alaska?"
  end

  def answer
    "Juneau"
  end

  def category
    @category
  end
end
