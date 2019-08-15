class Card
# TODO: go ahead and use an attr_reader 
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
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
