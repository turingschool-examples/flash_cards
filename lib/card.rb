class Card
    attr_reader :question, :answer, :category

    def initialize(question, answer, category)
        @question = question
        @answer = answer
        @category = category
    end

    def Question?
        "What is the capital of #{}"
    end
end

