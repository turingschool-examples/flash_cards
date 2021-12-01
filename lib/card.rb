class Card
  attr_reader :question, :category
  def initialize(question, capital, category)
    @question = question
    @capital = capital
    @category = category
  end

  def answer
    @capital
  end
end
