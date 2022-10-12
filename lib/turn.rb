require './card'

class Turn
    attr_reader :guess, :card
    def initialize(guess, card)
        @guess = guess
        @card = card
    end
    def correct?
            guess == card.answer
    end
    def feedback
        if 
            self.correct? == true
            return "Correct!"
            puts "Correct!"
        else
            return "Incorrect."
            puts "Incorrect."
        end
    end
end