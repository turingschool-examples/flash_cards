require './lib/card'
class Turn
 
    attr_reader :guess, :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end


    def correct?
        #if guess == @answer was not correct because @answer is not defined in turn class.
            @guess == @card.answer
    end

    def feedback
        if @guess == @card.answer
            "Correct!"
        else
            "sorry, not correct."
        end
    end   
end