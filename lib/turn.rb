require './lib/card'
class Turn

    # attr_reader :guess, :card

    def initialize(guess, card)
        @guess = guess 
        @card = card 
    end

    def correct?
       true if @guess == @card.answer
    end
    
    def feedback
        if @guess == correct? 
            puts "correct"
        else 
            "incorrect"
        end
    end 
end
