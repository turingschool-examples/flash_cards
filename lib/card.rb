class Card
  attr_reader :question, :answer, :category

    def initialize(question, answer, category)  #create card & pass arguments to instance variables
      @question =  question                     
      @answer = answer                          
      @category = category
    end

end