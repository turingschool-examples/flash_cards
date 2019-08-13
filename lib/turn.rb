class Turn
    attr_accessor :guess, :card, :correct

    def initialize(guess, card)
        @guess = guess
        @card = card
        @correct = correct?
    end

    def correct?
        return @guess == @card.answer
    end

    def feedback
        if @correct
            "Correct!"
        else
            "Incorrect." 
        end
    end
end