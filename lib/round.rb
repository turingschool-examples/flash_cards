class Round
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card = @deck.cards[0] #Had to look this up, may be wrong
        @number_correct = 0
    end

    # def current_card
    #     @deck.cards[@current_card_index] #selects the card
    # end

    def take_turn(guess)
        new_turn = Turn.new(guess, @current_card) #uses the guess and current card as a turn
        @number_correct += 1 if  turn.correct?

        @turns << new_turn
        @current_card = @deck.cards.rotate![0]  #do I need more here?
        new_turn #I have to print the new turn
    end

    def number_correct #number correct per turn
        @turns.count{ |turn| turn.correct? }
    end

    def number_correct_by_category(category)
        @turns.count {|turn| turn.card.category == category && turn.correct? }
    end

    def percent_correct
        return 0.0 if @turns.empty? #no division by 0
        (number_correct.to_f / @turns.length * 100).round(1) #converting to float for division
    end

    def percent_correct_by_category(category)
        category_turns = @turns.select {|turn| turn.card.category == category}
        return 0.0 if @turns.empty?
        correct_in_category = category_turns.count {|turn| turn.correct?}
        (correct_in_category.to_f / category_turns.length * 100).round(1)
    end
end
