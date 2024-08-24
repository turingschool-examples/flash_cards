class Turn
    attr_reader :guess
    attr_reader :card
  
    def initialize(guess, card)
        @guess = guess
        @card = card
       
    end
    
    def card 
     @card 
    end

  
    
    def correct?
        if (guess.upcase) == (answer.upcase)
            then true
        else false
        end
    end
    
    def feedback
        if correct? == true
            then p "Correct"
        else p "Incorrect"
            #2 tests for control flow stuff

        end
    end    
end