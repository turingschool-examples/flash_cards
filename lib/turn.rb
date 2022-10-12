require './card'

class Turn
    attr_reader :guess, :card
    def initialize(guess, card)
        @guess = guess
        @card = card
    end
    def correct?
        if 
            guess == card.answer
            return true
            puts true
        else
            return false
            puts false
        end
    end
end