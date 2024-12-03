class Card
    attr_reader :question, :answer

    def initialize(question, answer, category)
        @question = question
        @answer = answer
    end
end