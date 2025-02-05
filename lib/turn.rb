class Turn
    attr_reader :answer, :card, :guess, :correct

    def initialize(answer, card)
        @card = card
        @answer = answer
        @guess = "Juneau"
        @correct = true
    end
    def correct?
        correct = true 
    end
end
   

