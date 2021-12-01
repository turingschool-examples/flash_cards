class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

class Turn
  attr_reader :string, :card
  def initialize(string, card)
    @string = string
    @card = card
  end

end
