class Turn
    attr_reader :card, :guess

    def initialize(guess, card)
        @card = card
        @guess = guess
    end

    def correct?
        @guess.downcase == @card.answer.downcase
    end

    def feedback
        if correct?
            "Correct!"
        else
            "Incorrect."
        end
    end
end