class Card
  attr_reader :question, :answer, :category

  def initialize(q, a, c)
    @question = q
    @answer = a
    @category = c
  end

  # def question
  #   @question
  # end
  # 
  # def answer
  #   @answer
  # end
  #
  # def category
  #   @category
  # end
end
