require './lib/card.rb'

class Turn

    attr_reader :guess, :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        if @guess == @card.answer
            true
        else
            false
        end
    end

    def feedback
        if correct?
            p "Correct!"
        else
            p "Incorrect!"
        end
    end
end