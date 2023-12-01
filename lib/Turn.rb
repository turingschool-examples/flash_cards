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
end