class Turn

    attr_reader :guess,
                :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        if @card.answer == @guess
            return true
        else
            false
        end
    end

    def feedback
        if correct?
            return "Correct!"
        else
            return "Incorrect."
        end
    end
end