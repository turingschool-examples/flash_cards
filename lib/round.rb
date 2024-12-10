require './lib/deck'
require './lib/card'
require './lib/turn'

class Round
    attr_reader :deck, :turns, :turns_taken
    attr_accessor :number_correct, :correct_count_by_category, :cards_by_category
    def initialize(deck)
        @deck = deck
        @turns = []
        @turns_taken = 0
        @number_correct = 0
        @correct_count_by_category = Hash.new(0)
        @cards_by_category = Hash.new(0)
    end

    def current_card
        @deck.cards.first
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        @turns_taken += 1
        @cards_by_category[current_card.category] += 1
        if new_turn.guess == current_card.answer
            @number_correct = @number_correct + 1 #(shorthand is +=)
            @correct_count_by_category[current_card.category] += 1
        end
        @deck.cards = @deck.cards.rotate(1)
        return new_turn
    end

    def number_correct
        @number_correct
    end

    def percent_correct
        @number_correct.div(@turns_taken)*100
    end

    def number_correct_by_category(category)
        return @correct_count_by_category[category]
    end

    def percent_correct_by_category(category)
        @correct_count_by_category[category].div(@cards_by_category[category])*100
    end
end

