#This is a file creating the turn class
#ITERATION 1
require './lib/card'

class Turn
    attr_reader :guess, :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        @guess == card.answer
    end

    def response
        if correct? == true
            "You got it!"
        else
            "Wrong!"
        end
    end
end
