class Card

    attr_reader :question, :answer, :category

    def initialize(question, answer, category)
        @answer = answer
        @question = question
        @category = category
    end
end