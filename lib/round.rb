require './lib/turn'

class Round

    attr_reader :deck, :turns
    def initialize(deck)
        @deck = deck        
        @turns = []
    end

    def current_card
        index = @turns.length
        @deck.cards[index]
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)
        @turns << turn
        return turn
    end

    def number_correct
        @turns.find_all do |turn|
            turn.correct?
        end.length
    end

    def number_correct_by_category(category)
        @turns.find_all do |turn|
            turn.correct? && turn.card.category == category
        end.length
    end
end