class Card
  attr_reader :question, :answer, :category
  def initialize(question,answer,category)
    @question = question
    @answer = answer
    @category = category
  end

  def ==(other_card)
    other_card.class == self.class &&
    other_card.question == self.question &&
    other_card.answer == self.answer &&
    other_card.category == self.category
  end
end
