class Turn
    attr_reader :guess,
                :card
    
    def initialize (guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        if @guess
            return true
        end
    end

    def feedback
        if correct?
            puts "Correct!"
        else
            puts "Incorrect."
        end
    end
end