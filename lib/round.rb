class Round
    attr_reader :deck, :turns, :cards, :number_correct
    
    def initialize (deck)
        @deck = deck
        @cards = cards
        @turns = []
        @number_correct = 0
        @correct_turns = @correct_turns
        @category_turns = @category_turns

    end

    def current_card
        deck.cards[0]
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)
        @turns << turn
        if guess == current_card.answer
            @number_correct += 1 
        end
        deck.cards.rotate!
        return turn
    end

    def number_correct_by_category(category)

        @correct_turns = turns.select do |turn|
           turn.card.category == category && turn.correct?
        end

        return @correct_turns.count
    end

    def percent_correct
     ((@number_correct / @turns.count.to_f )* 100).round(1)
    end

    def percent_correct_by_category(category)
        @correct_turns = turns.select do |turn|
            turn.card.category == category && turn.correct?
        end

        @category_turns = turns.select do |turn|
            turn.card.category == category
        end

        ((@correct_turns.count / @category_turns.count.to_f) * 100).round(1)
    end
end