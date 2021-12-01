class Card

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = :categroy
  end

  def question
    @question = "What is the capital of Alaska?"
  end

  def answer
    @answer = "Juneau"
  end

  def category
    @category = :Geography
  end

end
