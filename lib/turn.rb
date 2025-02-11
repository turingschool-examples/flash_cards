class Turn
    attr_reader :guess, :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    #Non-case sensative
    def correct?
        @guess.downcase == @card.answer.downcase
    end

    def feedback
        correct? ? "Correct" : "Incorrect" #ternary
        # if correct?
        #     "Correct"
        # else
        #     "Incorrect"
        # end
    end
end


