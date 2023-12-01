class Turn
    attr_reader :guess, :card
    def initialize(guess, card)
        @guess = guess
        @card = card
    end
    
    def correct?
        @guess.eql? card.answer 
    end
    
    def feedback
        if correct?
            "Correct!"
        else 
            "Incorrect!"
        end
    end
end