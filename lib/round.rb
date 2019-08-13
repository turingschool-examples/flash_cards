class Round
    # Allow user to read deck after round initialization
    attr_accessor :deck

    # Initialize deck instance variable
    def initialize(deck)
        @deck = deck
    end

end
