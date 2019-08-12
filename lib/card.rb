class Card
    # Allow user to read/write card variables after creation
    attr_accessor :question, :answer, :category

    # Initialize card instance variables
    def initialize(question, answer, category)
        @question = question
        @answer = answer
        @category = category
    end
end
