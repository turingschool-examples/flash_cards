class Card

  attr_reader :question, :answer, :category


  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end





#card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#mercury = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
