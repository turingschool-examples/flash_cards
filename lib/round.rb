require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card
        @deck.cards[0]
    end
 
    def take_turn(guess)
        current_turn = Turn.new(guess, current_card)
        @turns << current_turn
        @deck.move_card_to_back
        current_turn
    end

    def number_correct
    end

    def number_correct_by_category(category)
    end

    def percent_correct
    end

    def percent_correct_by_category(category)
    end

end