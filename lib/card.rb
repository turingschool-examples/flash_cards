class Card
    attr_reader :question, :answer, :category

    def initialize(question, answer, category)
        @question = question.downcase
        @answer = answer.downcase
        @category = category.downcase
    end
end