require './lib/card'
class Turn
    attr_reader :guess, :card

    def initialize(guess, card)
        @guess = guess
        @card = card
        @result = true
    end

    def card
        return @card
    end

    def correct?
        if turn.guess == @card.answer
            result = true
        else
            result = false
        end
    end

    def feedback
        if result == true
            puts "Correct!"
        elsif result == false
            puts "Incorrect"
        else
            puts "Error, try again"
        end
    end
end