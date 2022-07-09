

class Turn
    attr_reader :guess, :card, :correct, :feedback
    def initialize(guess, card, feedback)
        @guess = guess
        @card = card
        @correct = correct
        @feedback = feedback
    end
    
 def correct?
    @guess == card.answer
 end

 def feedback
    if correct? == true
        p 'Correct!'
    else
        p "Incorrect."
    end

end