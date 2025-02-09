class Round
    # initialized deck, turns and current_card
    attr_reader :deck, :turns, :current_card
    def initialize(deck)
        @deck = deck
        @turns = []
        # current_card is returning the first card in deck
        @current_card = deck.cards.first
    end
    def take_turn(guess) # this is creating the take_turn method and is taking the argument guess from the Card
        # current_card is returning the current card in the deck
        # making a new turn instance that gets stored in @turns and moves to the next turn
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
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

end