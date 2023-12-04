class Card
    attr_reader :answer, :question, :category

 def initialize(question, answer, category)
        @question = question
        @answer = answer
        @category = category
    end
end
