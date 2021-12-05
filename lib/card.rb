class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

  # def question
  #   return @question
  # end
  #
  # def answer
  #   return @answer
  # end
  #
  # def category
  #   return @category
  # end

end
