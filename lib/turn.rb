require_relative 'card'

class Turn
    attr_reader :guess
    attr_reader :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def guess
        @guess 
    end

    def correct?
        #returns boolean if guess matches answer on card
        @guess == @answer 
    end
end

