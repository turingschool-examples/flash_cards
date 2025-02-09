class Round
    # initialized deck, turns and current_card
    attr_reader :deck, :turns, :current_card
    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card_index = 0
    end
    def take_turn(guess) # this is creating the take_turn method and is taking the argument guess from the Card
        # current_card is returning the current card in the deck
        # making a new turn instance that gets stored in @turns and moves to the next turn
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        next_card
        new_turn
    end
    def number_correct
        # uses the @turns array 
        @turns.count {|turn| turn.correct?}
        # {|turn| turn.correct?} this is checking to see if each Turn was correct
    end
    def number_correct_by_category(category)
        # counts the number of correct asnwers in categories
        @turns.count {|turn| turn.correct? && turn.card.category == category}
        # this is doing the same things as above pretty much excpet it's also getting the category
    end
    def percent_correct
        total_turns = @turns.length
        correct_turns = @turns.count {|turn| turn.correct?}
        return 0 if total_turns == 0
    end
    def percent_correct_by_category
        # Get the total number of turns for the given category
        total_turns_in_category = @turns.count { |turn| turn.card.category == category }
  
        # Get the number of correct turns in that category
        correct_turns_in_category = @turns.count { |turn| turn.correct? && turn.card.category == category }

        return 0 if total_turns_in_category == 0 
    end
    def display_card # made a method to display the card with a puts statement. 
        # it's calling the current_card and using the .question method on it to show the text of the question.
        puts "Current Card: #{current_card.question}"
    end
    def current_card
        @deck.cards[@current_card_index]  # get the current card by its index
    end
    def next_card
        @current_card_index += 1 if @current_card_index < @deck.cards.length - 1
    end
end