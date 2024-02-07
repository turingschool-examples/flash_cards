require './lib/card'

class Turn
    attr_reader :guess, :card 

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        @guess.downcase == @card.answer.downcase
    end

    def feedback
        return "Incorrect." if @guess.downcase != @card.answer.downcase
        "Correc!"
    end
end