class Card
  attr_reader :category, :question, :answer

  def initialize (question, answer, category)
    @category = category
    @question = question
    @answer = answer
  end
end

card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
