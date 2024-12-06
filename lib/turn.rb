require './lib/card'
require './lib/turn'
class Turn
    attr_reader :guess, :card, :answer
    def initialize(guess, card)
        @guess = guess
        @card = card
        @answer = answer
    end

    def correct?
       guess == @answer?
    end
    def feedback
        if correct? == true
            puts "Correct!"
        else
            puts "Incorrect"
        end
    end
end
    

        