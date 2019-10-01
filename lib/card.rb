class Card
  attr_accessor :question, :answer, :category
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end

card1 = Card.new("What is the capital of California?", "Sacramento", :Geography)
card2 = Card.new("What is the capital of Colorado", "Denver", :Geography)
