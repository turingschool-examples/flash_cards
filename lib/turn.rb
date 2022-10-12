class Turn
    attr_reader :string
    attr_reader :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end
end

