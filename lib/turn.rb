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
        guess.casecmp(@card.answer) == 0
    end

    # Define method to give feedback on guess
    def feedback
        if correct?
            "Correct!"
        else
            "Incorrect."
        end
    end
end
