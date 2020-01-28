class Card
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @catgory = category
  end

  def question
    p "#{@question}"
  end

  def answer
    p "#{@answer}"
  end

  def category
    p @category
  end

end
