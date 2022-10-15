class Round
    attr_reader :deck, :turns, :number_correct, :feedback

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
        @feedback
    end

    def current_card
        @deck.cards[0]
    end

    def take_turn(guess, card = current_card)
        #this method does too many things, create helper methods
        turn = Turn.new(guess, card)
        @number_correct += 1 if turn.correct?
        @feedback = turn.feedback
        @turns << turn
        deck.change_card
        turn
    end

    def number_correct_by_category(category)
        #refactor
        category_score = 0
        turns.each do |turn| 
            if turn.correct? && turn.card.category == category
                category_score += 1
            end
        end
        category_score
    end

    def percent_correct
        @number_correct.fdiv(@turns.length) * 100.0
    end

    def percent_correct_by_category(category)
        #refactor (look at deck method)
        number_correct_by_category(category).fdiv(@turns.count{|turn| turn.card.category == category}) * 100.0
    end

end
