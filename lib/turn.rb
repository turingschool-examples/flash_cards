require './lib/card'
#req the file to "pull" the info from that file into this one
class Turn
    attr_reader :guess, :card #these will recieve input; if only output do not include
    def initialize(guess, card)#arguments 
        @guess = guess
        @card = card
    end
    
    def correct?
        @guess == card.answer
#have access to card.answer via line 1, the card.rb code
#output only so dont need to attr_
#linking the answer to the guess in this boolean
    end
    
    def feedback
        if correct? == true
            'Correct!'
# puts not needed/not to print out to anyone
        else
            "Incorrect."
        end
    end   



end     