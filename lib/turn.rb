#This is a file creating the turn class
#ITERATION 1

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
        if correct? == true
            p "You got it!"
        else
            p "Wrong!"
        end
    end
end
