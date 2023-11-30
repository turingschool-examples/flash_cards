class Card
  attr_reader :question, :answer, :category
  def initialize(question, answer, category = :geography)
    @question = question
    @answer = answer
    @category = category
  end
end

