class Card
  attr_accessor :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

end

# card = Card.new("Test1", "Test2", "Test3")
# puts card.question
