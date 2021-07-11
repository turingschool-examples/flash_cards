class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer.upcase #breaks most tests, could put it in the correct? method 
    @category = category
  end

end
