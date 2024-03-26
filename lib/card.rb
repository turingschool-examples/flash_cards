class Card

    attr_reader :question, :answer, :category

    def initialize(question, answer, category)
        @question = question
        @answer = answer
        @category = category
    end

    def answer
        @answer
    end
end