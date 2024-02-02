require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
    attr_reader :deck, 
                :turns,
                :number_correct

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
    end

    def current_card
        @deck.cards[0]
    end
 
    def take_turn(guess)
        current_turn = Turn.new(guess, current_card)
        correct_guess(current_turn)
        @turns << current_turn
        @deck.move_card_to_back
        current_turn
    end

    def correct_guess(turn)
        @number_correct += 1 if turn.correct?
    end

    def number_correct_by_category(category)
        @turns.count do |turn|
            turn.card.category == category && turn.correct?
        end
    end

    def percent_correct
    end

    def percent_correct_by_category(category)
    end

end