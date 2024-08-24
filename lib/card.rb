class Card
    attr_reader :category
    attr_reader :question
    attr_reader :answer
   
    def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
    end
    
  
end