class Card
    def initialize(question, answer, category)
        @question = question
        @answer = answer
        @category = category
    end

    def question
        @question = "What is the capital of Alaska?"
    end

    def answer
        @answer = "Juneau"
    end
end