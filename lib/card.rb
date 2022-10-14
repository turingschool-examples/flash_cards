class Card
  attr_reader :question,
              :answer,
              :category

  define initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end
