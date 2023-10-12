class Turn
    attr_reader :guess, :card
    def initialize(guess_input, card_input)
        @guess = guess_input
        @card = card_input
    end

    def correct?
        if guess.to_s == card.answer.to_s
            true
        elsif guess.to_s != card.answer.to_s
            false
        end
    end

    def feedback
        if correct?
            "Correct!"
        else
            "Incorrect."
        end
    end
end