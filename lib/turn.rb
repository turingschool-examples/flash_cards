class Turn
    attr_reader :card, :guess

    def initialize(guess = "Juneau", card)
        @guess = guess
        @card = card
    end

    def correct?
        return true if guess == card.answer
        false
    end

    def feedback
        if guess == card.answer
        "Correct!"
        else
        "Incorrect."
        end
    end
end