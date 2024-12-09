require './lib/deck'
require './lib/card'
require './lib/turn'

class Round
    attr_reader :deck, :turns, :turns_taken
    attr_accessor :number_correct, :number_correct_by_category
    def initialize(anything)
        @deck = anything
        @turns = []
        @turns_taken = 0
        @number_correct = 0
        @number_correct_by_category = 0
    end

    def current_card
        @deck.cards.first
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        @turns_taken += 1
        if new_turn.guess == current_card.answer
            @number_correct = @number_correct + 1 #(shorthand is +=)
        end 
        @deck.cards = @deck.cards.rotate(1)
        return new_turn
    end

    def number_correct
        @number_correct
    end

    def percent_correct
        @turns_taken / @number_correct
    end

    def number_correct_by_category(category)
        turns.each do |turn|
            if turn.card.category == category
                @number_by_category += 1
            end
            return number_correct_by_category
    end

    def percent_correct_by_category
        @turns_taken / @number_correct_by_category
    end
end
end
