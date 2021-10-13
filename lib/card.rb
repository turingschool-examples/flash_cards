class Card
  attr_accessor :question,
                :answer,
                :category
  def initialize(card_question, card_answer, card_category)
    @question = card_question
    @answer = card_answer
    @category = card_category
  end
end
