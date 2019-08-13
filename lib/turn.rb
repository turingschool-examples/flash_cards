class Turn
    # Allow turn attributes to be read but not written
    attr_reader :guess, :card

    # Initialize guess and card attributes
    def initialize(string, card)
        @guess = string
        @card = card
    end

    # Define method that indicates if guess is correct
    def correct?
        # Ignore differences in capitalization
        if guess.casecmp(card.answer) == 0
            return true
        else
            return false
        end
    end

    # Define method to give feedback on guess
    def feedback
        if self.correct? == true
            return "Correct!"
        else
            return "Incorrect."
        end
    end
end
