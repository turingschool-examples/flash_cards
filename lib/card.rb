#Card class for flash_card project
#all flashcard templates must follow 'question','answer', :category

class Card
  attr_reader :question,
              :answer, 
              :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

end