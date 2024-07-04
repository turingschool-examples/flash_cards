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
        if guess == true
            return "Correct!"
        else
            return "Incorrect."
        end
    end
end