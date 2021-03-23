class Card

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

  def question
    "What is the capital of Alaska?"
  end

  def answer
    "Juneau"
  end

  def category
    :Geography
  end
end
