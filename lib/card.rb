#card.rb - defines the Card class

class Card
    # Permit member variables to be accessed by methods
    attr_reader :category, :question, :answer

    #Initialize method
    def initialize(question_string, answer_string, category)
        @question = question_string
        @answer = answer_string
        @category = category
        #Note: no error checking is present here (i.e. a non-string arg could be passed)    
    end

    #Other methods

end