class Round
    # Allow user to read deck after round initialization
    attr_reader :deck, :turns

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

    # Define method to calculate percent correct by category
    def percent_correct_by_category(category)
        # Count the number of cards used within the given category
        cards_in_cat = 0
        @turns.each do |turn|
            if turn.card.category == category
                cards_in_cat += 1
            end
        end

        # Return the number correct in given category divided by total cards
        if cards_in_cat != 0
            return self.number_correct_by_category(category).to_f / cards_in_cat.to_f * 100
        # Avoid dividing by 0
        else
            return 0
        end
    end

    # Define method to start a command-line interaction with user
    def start
        # Start user experience and initialize a categories array
        puts "Welcome! You're playing with #{@deck.cards.length} cards."
        puts "-" * 50
        categories = Array.new

        # Iterate over each card in the deck
        @deck.cards.each do |card|

            # Tell the user the card number and the card's question
            puts "This is card number #{@index + 1} out of #{@deck.cards.length}."
            puts "Question: #{card.question}"

            # Allow user to input a guess and check correctness
            turn = self.take_turn(gets.chomp)
            puts turn.feedback

            # Add new card categories to the array of categories
            if !categories.include?(card.category)
                categories.push(card.category)
            end
        end

        # Display general game statistics
        puts "****** Game over! ******"
        puts "You had #{self.number_correct} correct guesses out of #{@deck.cards.length} for a total score of #{self.percent_correct.round}%."

        # Display category-specific statistics
        categories.each do |cat|
            puts "#{cat} - #{self.percent_correct_by_category(cat).round}% correct"
        end
    end
end
