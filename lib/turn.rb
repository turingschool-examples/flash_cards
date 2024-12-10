class Turn
    attr_reader :guess, :card

    def initialize(guess, card)
        @guess = guess.downcase
        @card = card
    end

    def correct?
        if @guess == card.answer
            true
        else
            false
        end
    end

    def feedback
        if @guess == card.answer
            "Correct"
        else
            "WRONG-O!"
        end
    end
end