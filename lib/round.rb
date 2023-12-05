require './lib/deck'
require './lib/card'
require './lib/turn'

class Round

    attr_reader :deck, :turns, :current_card_index, :current_turn

    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card_index = 0
        @current_turn = 1
    end

    def current_card
        @deck.cards[current_card_index]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        @current_card_index += 1
        new_turn
    end

    def number_correct
        @turns.count { |turn| turn.correct? }
    end

    def number_correct_by_category(category)
        @turns.count { |turn| turn.card.category == category && turn.correct? }
    end

    def total_by_category(category)
        @turns.count { |turn| turn.card.category == category && turn.correct? }
    end

    def percent_correct
        (number_correct.to_f / @turns.length.to_f) * 100
    end

    def percent_correct_by_category(category)

        if total_by_category(category).zero?
            return 0
          else
            number_correct_by_category(category) / total_by_category(category) * 100
          end
    end

end
