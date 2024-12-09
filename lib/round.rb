require './lib/deck'
require './lib/card'
require './lib/turn'

class Round
    attr_reader :deck, :turns, :turns_taken, :number_correct, :new_turn
    def initialize(anything)
        @deck = anything
        @turns = []
        @turns_taken = 0
        @number_correct = 0
    end

    def current_card
        @deck.cards.first
    end

    def take_turn(guess)
        @new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        @turns_taken += 1
        return new_turn

    end

    def number_correct
        if @new_turn.guess == current_card.answer
            return @turns_taken - 1
        end    
    end

    def percent_correct
        @turns_taken / @number_correct
    end
end
