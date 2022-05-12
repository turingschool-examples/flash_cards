class Card
  attr_reader :question,:answer, :category, :prompt


  def initialize(question, answer, category) #initializes the card class with basic properties
    @question = question
    @answer = answer
    @category = category #looks like an attr_reader but is like a string variable sorta, would have to utilize ._s to manipulate
  end

end
