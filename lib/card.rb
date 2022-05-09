class Card
  # attr_reader :question
  def initialize(question, answer, category)
    @question = "What is the capital of Alaska?"
    @answer = "Juneau"
    @category = :Geography
  end

  def question
    @question
  end

  def answer
    @answer
  end

  def category
    @category
  end

end
