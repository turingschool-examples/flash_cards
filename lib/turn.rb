class Turn 
    attr_reader :guess 

    def initialize(guess, card)
        @guess = guess 
        @card = card
    end 
end 