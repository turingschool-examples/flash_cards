class Turn 
    attr_reader :guess, :card 

    def initialize(guess, card)
        @guess = guess 
        @card = card
    end 

    def correct? 
        @card && @guess == @card.answer
    end 

end 