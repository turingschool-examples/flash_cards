class Round
    # Allow user to read deck after round initialization
    attr_reader :deck, :turns

    # Initialize deck instance variable
    def initialize(deck)
        @deck = deck
        @turns = []
        @index = 0
    end

    # Define method to access the current card
    def current_card
        return @deck.cards[@index]
    end

    # Define method to take user's guess and evaluate correctness
    def take_turn(guess)
        # Create a new Turn instance
        turn = Turn.new(guess, @deck.cards[@index])

        # Add this turn to the array of turns
        @turns.push(turn)

        # Move to the next card in the deck
        @index += 1

        # Return the current turn
        return turn
    end

    # Define method to calculate number of correct turns
    def number_correct
        # Count the number of correct turns taken
        @turns.count do |turn|
            turn.correct?
        end
    end

    # Define method to calculate number of correct turns by category
    def number_correct_by_category(category)
        # Count the number of correct turns where input == category
        @turns.count do |turn|
            turn.card.category == category && turn.correct?
        end
    end

    # Define method to calculate percent correct
    def percent_correct
        number_correct.to_f / turns.length * 100
    end

    # Define method to calculate percent correct by category
    def percent_correct_by_category(category)
        # Count the number of cards used within the given category
        cards_in_cat = @turns.count do |turn|
            turn.card.category == category
        end

        # Return the number correct in given category divided by total cards
        if cards_in_cat != 0
            return number_correct_by_category(category).to_f / cards_in_cat * 100
        # Avoid dividing by 0
        else
            return 0.0
        end
    end

    # Define method to start a command-line interaction with user
    def start
        # Start user experience and initialize a categories array
        puts "Welcome! You're playing with #{@deck.cards.length} cards."
        puts "-" * 50
        categories = []

        # Iterate over each card in the deck
        @deck.cards.each do |card|

            # Tell the user the card number and the card's question
            puts "This is card number #{@index + 1} out of #{@deck.count}."
            puts "Question: #{card.question}"

            # Allow user to input a guess and check correctness
            turn = take_turn(gets.chomp)
            puts turn.feedback

            # Add card categories to the array of categories
            categories.push(card.category)
        end

        # Display general game statistics
        puts "****** Game over! ******"
        puts "You had #{number_correct} correct guesses out of #{@deck.cards.length} for a total score of #{percent_correct.round}%."

        # Display category-specific statistics for all unique categories
        categories.uniq.each do |cat|
            puts "#{cat} - #{percent_correct_by_category(cat).round}% correct"
        end
    end
end
