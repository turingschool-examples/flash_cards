class Turn

    attr_reader :guess,
                :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        return true if @guess == guess
        false
    end

    def feedback
        return "Correct!"
    end
end