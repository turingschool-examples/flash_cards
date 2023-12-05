require "./lib/card"
require "./lib/turn"
require "./lib/deck"

class Round
    attr_reader :deck, :turns, :guess

    def initialize(deck)
        @deck = deck
        @guess = guess
        @turns = []
        @active_card = 0
        @correct_guesses = 0
    end

    def current_card
        @deck.cards[@active_card]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns.push(new_turn)
        @active_card = @active_card + 1
        if new_turn.correct? == true
            @correct_guesses = @correct_guesses + 1
        end
        new_turn
    end

    def number_correct
        @correct_guesses
    end

    def number_correct_by_category(category)
        @turns.count {|turn_result| turn_result.correct? && turn_result.card.category == category}
    end

    def percentage_correct
        (@correct_guesses.to_f / @turns.length.to_f * 100).round(ndigits=1)
    end

    def percent_correct_by_category(category)
        (number_correct_by_category(category) / @turns.count {|turn_result| turn_result.card.category == category}.to_f * 100).round(ndigits=1)
    end
end