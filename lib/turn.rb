class Turn
    attr_reader :guess, :card
  
    def initialize(guess, card)
        @guess = guess
        @card = card
       
    end
    
    
    def correct?
     @guess.upcase == @card.answer.upcase
        
    end
    
    def feedback
        if correct? == true
          "Correct"
        else  "Incorrect"
            #2 tests for control flow stuff

        end
    end    
end