require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'

class Round

    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        @turns_taken = 0
    end

    def current_card
        @deck.cards[@turns_taken]
    end

    def take_turn(guess)
        taken_turn = Turn.new(guess, current_card)
        @turns_taken += 1
        @turns << taken_turn
        @turns[-1]
    end

    def number_correct
        @turns.count do |turn|
            turn.correct?
        end
    end

    def number_correct_by_category(category)
        @turns.count do |turn|
            turn.card.category == category && turn.correct?
        end
    end

    def percent_correct
        ((number_correct.to_f / @turns.count.to_f) * 100).round(1)
    end

    def turns_by_category(category)
        @turns.count do |turn|
            turn.card.category == category
        end
    end

    def percent_correct_by_category(category)
        ((number_correct_by_category(category).to_f / 
        turns_by_category(category).to_f) * 100).round(1)
    end
end