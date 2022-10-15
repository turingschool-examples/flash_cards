class Round
    attr_reader :deck, :turns, :number_correct, :feedback

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
        @feedback
    end

    def current_card
        @deck.current_card
    end

    def take_turn(guess, card = current_card)
        turn = Turn.new(guess, card)
        @number_correct += 1 if turn.correct?
        @feedback = turn.feedback
        @turns << turn
        deck.change_card
        turn
    end

    def number_correct_by_category(category)
        turns.select{|turn| turn.correct? && turn.card.category == category}.length 
    end

    def percent_correct
        @number_correct.fdiv(@turns.length).round(3) * 100.0
    end

    def percent_correct_by_category(category)
        #the hash doesnt make anything easier. consider removing.
        number_correct_by_category(category).fdiv(@deck.category_data[category].length).round(3) * 100.0
    end

end
