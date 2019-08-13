class Turn
    # Allow turn attributes to be read but not written
    attr_reader :string, :card

    # Initialize guess and card attributes
    def initialize(string, card)
        @guess = string
        @card = card
    end
end
