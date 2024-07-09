class Turn 
    attr_reader :card, :guess, :answer, :feedback

    def initialize(card, guess, answer, feedback)
        @card = card
        @guess = guess
        @answer = answer
        @feedback = feedback
    end
end