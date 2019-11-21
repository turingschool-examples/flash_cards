class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
# require "pry"; binding.pry
end

# def question
#  @question
# end

#card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

# require "pry"; binding.pry
#p card.question
