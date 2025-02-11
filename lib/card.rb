class Card # class name is card
    # created getter methods for question, answer nad category
    attr_reader :question, :answer, :category
    def initialize(question, answer, category)
        # this will hold out cards questions, answers and categories
        @question = question
        @answer = answer
        @category = category
    end
end