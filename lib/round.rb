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

    # Define method to calculate number of correct turns
    def number_correct
        # Initialize a counting variable and count the number of correct turns
        correct = 0
        @turns.each do |turn|
            if turn.correct? == true
                correct += 1
            end
        end

        # Return that number
        return correct
    end

    # Define method to calculate number of correct turns by category
    def number_correct_by_category(category)
        # Initialize a counting variable and count the number of correct turns
        correct = 0
        @turns.each do |turn|
            if turn.card.category == category && turn.correct? == true
                correct += 1
            end
        end

        # Return that number
        return correct
    end

    # Define method to calculate percent correct
    def percent_correct
        return self.number_correct.to_f / turns.length.to_f * 100
    end

end
