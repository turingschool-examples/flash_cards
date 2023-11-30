
class Turn
   attr_accessor :card
   attr_reader :guess

    def initialize (guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        @guess == @card.answer
    end
end