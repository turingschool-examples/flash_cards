class Turn
    attr_reader :guess, :card, :correct?, :feedback
    def initialize(string, card)
        @string = string
        @guess = guess
        @card = card
        @correct = correct
        @feedback = feedback
    end
end