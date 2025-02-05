class Turn
    def initialize(guess,card)
        @guess = guess
        @card = card
    end
    # def card is defining the card method which a question and answer 
     def card
         @question = "What is the capital of Alaska?"
         @answer = "Juneau"
     end
     # def guess is defining the guess method which is the answer to the question
     def guess
            @guess = "Juneau"
     end
     # def correct? is defining the correct? method which checks if the guess is correct or not
     def correct?
        if @guess == "Juneau"
            true
        else
            false
        end
     end
     # def feedback is defining the feedback method which gives feedback based on the guess
     def feedback
        if @guess == "Juneau"
            "Correct!"
        else
            "Incorrect."
        end
     end
end