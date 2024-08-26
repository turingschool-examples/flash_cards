class Turn
    attr_reader :card, :guess
    attr_writer :card, :guess

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        return true if card.answer.downcase == guess.downcase 
        false
    end

    def feedback
        if card.answer.downcase == guess.downcase
        "Correct!"
        else
        "Incorrect."
        end
    end
end