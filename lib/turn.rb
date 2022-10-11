class Turn
   attr_reader :guess,
               :card
    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        if @guess == card.answer
            true
        end
    end

    def feedback
        if correct? == true
            "Correct!"
        else
            "Try Again"
        end
    end
end