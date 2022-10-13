require './lib/turn'
require './lib/card'
require './lib/deck'

class Round
    attr_reader :deck, :turns, :number_correct

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
    end

    def current_card
        current_card = @deck.cards
        current_card[turns.count]
    end

    def take_turn(answer)
        new_turn = Turn.new(answer, current_card)
        @turns << new_turn
        if new_turn.correct?
            @number_correct += 1
        end
        return new_turn
    end

    def number_correct_by_category(category)
        match_category = []
        correct_in_category = 0
        turns.each do |turn|
            if turn.card.category == category
                match_category << turn
            end
        end
        match_category.each do |card|
            if card.correct?
                correct_in_category += 1
            end
        end
        correct_in_category
    end

    def percent_correct
        ((number_correct.to_f / turns.count).round(2)) * 100
    end
end