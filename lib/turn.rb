class Turn
    attr_reader :guess, :card, :correct, :feedback
   
    def initialize(guess, card )
        @guess = guess  
        @card = card 
        @correct = []
        @feedback = []
    end

    def correct?
        @guess = card.answer
    end

    def feedback
        if @guess = card.answer       
         puts "Correct!"
        else
            puts "Incorrect!"
        end
    end
end