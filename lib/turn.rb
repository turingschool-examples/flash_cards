class Turn
    # The attr reader creates getter methods for instnace variables(ex. @guess,@card)
    attr_reader :guess, :card
    # Our initialize method is calling 2 parameters, guess and card.
    # It then assigns the values to our instnace values @guess and @card
    def initialize(guess,card)
        @guess = guess # stores the guess
        @card = card # stores the card object which contains the question and answer
    end
    # the def correct? method is using the instance variable @guess that stores the guess and is checking to see if it is equal to what is stored in @card
    def correct?
        @guess == @card.answer
     end
     # def feedback is checking if our correct? method received the correct guess. If not it will return the value incorrect
     def feedback
        if correct?
            "Correct!"
        else
            "Incorrect!"
        end
     end
end