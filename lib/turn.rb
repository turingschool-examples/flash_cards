require './lib/card'

class Turn
    
    attr_reader :guess, :card
    def initialize(guess, card)
        @guess = guess
        @card = card
    end



    def correct?
        is_correct = false
        if card.answer == @guess
            is_correct = true
            return is_correct
        end
    end

    def feedback
        if @guess == card.answer
            return "Correct!"
        else
            return "Incorrect!"
        end
    end

end

=begin

card - This method returns the Card
correct? - This method returns a boolean indicating if the guess matched the answer on the Card.
feedback - This method either returns "Correct!" or "Incorrect." based on whether the guess was correct or not.
=end