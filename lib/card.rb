class Card
  attr_reader :question, :answer, :category
  def initialize(question = nil, answer = nil, category = :none)
    @question = question
    @answer = answer
    @category = category
  end

end
