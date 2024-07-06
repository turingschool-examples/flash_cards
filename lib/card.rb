class Card
     attr_reader :question, :answer, :category
    
    def initialize(question, answer, category = "History") 
        @question = question
        @answer = answer
        @category = category
    end

end