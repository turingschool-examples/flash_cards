class Card
  attr_reader :question,
              :answer,
              :category

  #create a card
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

end
