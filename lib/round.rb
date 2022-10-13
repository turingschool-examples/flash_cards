class Round
    def initialize(deck_instance)
        @deck = @deck_instance
    end

    def take_turn(guess_string)
        @turn = Turn.new(guess_string, card)
    end
    # The take_turn method takes a string representing the guess. 
    # take_turn method should create a new Turn object with the appropriate guess and Card. 
    # take_turn method should store this new Turn, as well as return the new Turn from the take_turn method. 
    # When the take_turn method is called, the Round should move on to the next card in the deck.
end
