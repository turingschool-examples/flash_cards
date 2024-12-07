class Turn
    attr_reader :guess, :card, :answer
    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?
       guess == card.answer
    end
    def feedback
       if correct?
            print "Correct!"       
        else
            print "Incorrect."
        end
    end
end
    

        