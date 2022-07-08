# This is a file creating the hard class
# ITERATION 1

class Card
    attr_reader :question
    attr_reader :answer
    attr_reader :category
    
    def initialize(question,answer,category)
        @question = question
        @answer = answer
        @category = category
    end
end
