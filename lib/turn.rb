class Turn
    attr_reader :guess,
                :card
         
    
    def initialize (guess, card)
        @guess = guess
        @card = card.answer
      end

    def correct?
        if @guess == @card
            true
        else
            false
        end
    end

    def feedback
        if correct?
            puts "Correct!"
        else
            puts "Incorrect."
        end
    end
end