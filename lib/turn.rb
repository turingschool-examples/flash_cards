class Turn
    attr_reader :card, :guess

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        return true if card.answer.downcase == guess.downcase 
        false
    end

    def feedback
        if correct?
        "Correct!"
        else
        "Incorrect."
        end
    end
end