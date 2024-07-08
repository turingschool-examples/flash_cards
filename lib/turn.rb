class Turn
    attr_reader :guess,
                :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        @card.answer == @guess
    end

    def feedback
        if @guess = correct?
            "Your answer is correct!"
        else
           "I'm sorry your answer is incorrect."
        end
    end
end