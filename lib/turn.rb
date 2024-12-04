class Turn
    attr_reader :guess, :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        if @guess == card.answer
            true
        else
            false
        end
    end

    def response
        if @guess == card.answer
            p "Correct"
        else
            p "WRONG-O!"
        end
    end
end