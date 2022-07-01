class Card
  attr_reader :question,:answer, :category, :cards

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
    @cards = []
  end

end
