class Round
    # Allow user to read deck after round initialization
    attr_accessor :deck, :turns

    # Initialize deck instance variable
    def initialize(deck)
        @deck = deck
        @turns = Array.new
        @index = 0
    end

    # Define method to access the current card
    def current_card
        return deck.cards[@index]
    end

    # Define method to take user's guess and evaluate correctness
    def take_turn(guess)
        # Create a new Turn instance
        turn = Turn.new(guess, deck.cards[@index])

        # Add this turn to the array of turns
        @turns.push(turn)

        # Move to the next card in the deck
        @index += 1

        # Return the current turn
        return turn
    end
end
