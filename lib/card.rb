#card.rb - defines the Card class

class Card
    # Permit member variables to be accessed by methods
    attr_reader :category, :question, :answer

    #Initialize method
    def initialize(question_string, answer_string, category)
        @question = question_string
        @answer = answer_string
        @category = category
    end

    #Other methods

end