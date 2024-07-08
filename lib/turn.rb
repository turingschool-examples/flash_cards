class Turn
    attr_reader :guess,
                :card
    
    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        @guess = @guess.strip
        @guess.casecmp?(@card.answer.strip)
    end

    def feedback
        if correct? == true
            "Correct!"
        else
            "Better luck next time"
        end
    end
end
