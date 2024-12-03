class Card
    attr_reader :question

    def initialize(question, answer, category)
        @question = question
    end
end