class Turn

    attr_reader :card,
                :guess
                
                
        
     def initialize (card, guess)
        @card = card
        @guess = guess
     end


     def correct?
        @guess == @card.answer
        end

    def feedback
        if @guess == @card.answer
            "Correct!"
        else
            "incorrect."
        end
    end
end