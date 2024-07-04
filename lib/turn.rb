require './lib/card'

class Turn
    attr_reader :guess,
                :card,
                :correct,
                :feedback
    
    def initialize(guess, card)
        @guess = guess
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @correct = true
        @feedback = feedback
    end

    def correct?
        if self.guess != @card.answer
            @correct = false
            false
        else
            true
        end

    end

    def feedback
        if self.guess != @card.answer
            return "Incorrect"
        else
            return "Correct!"
        end
    end
end