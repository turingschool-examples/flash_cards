require 'pry'

class Turn
    attr_reader :guess, :card
    def initialize(guess,card)
        @guess = guess
        @card = card
    end

    def correct?
        if @card.answer.capitalize == @guess.capitalize
            true
        else
            false
        end
    end

    def feedback
        'Correct!' if correct? == true
        else
            'Incorrect.'
        end
    end

end