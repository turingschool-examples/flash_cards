class Round
    attr_reader :deck,
                :turns,
                :number_correct,
                :correct_by_cat
                :group

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
        @correct_by_cat = 0
    end

    def current_card
        current_card = @deck.cards
        current_card[turns.count]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        if new_turn.correct?
            @number_correct += 1
        end
        new_turn
    end

    def number_correct_by_category (category)
        group = []
        correct_by_cat = 0
        turns.each do |turn|
        if turn.card.category == category
          group << turn
        end
    end
        group.each do |card|
        if card.correct?
          correct_by_cat += 1
        end
        end
        correct_by_cat
    end

    def percent_correct
        answer = ((number_correct.to_f / turns.count) * 100)
        return answer.round(1)
    end

    def percent_correct_by_category (category)
        group = []
        correct_by_cat = 0
        turns.each do |turn|
        if turn.card.category == category
          group << turn
        end
        end
        group.each do |card|
        if card.correct?
          correct_by_cat += 1
        end
        end
        answer_by_cat = ((correct_by_cat.to_f / group.count) * 100)
        return answer_by_cat.round(1)
     end
end
