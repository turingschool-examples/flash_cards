class Card
attr_reader :question, :answer, :category
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
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
