class Turn
    attr_reader :string, 
                :card, 
                :guess

    def initialize(guess, card)
        @guess = guess
        @card = card
    end
end