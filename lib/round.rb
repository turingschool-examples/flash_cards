require './lib/deck'
require './lib/turn'

class Round

    attr_reader :deck,
                :current_card,
                :turns,
                :number_correct

    def initialize(deck)
        @deck = deck
        @current_card_index = 0
        @current_card = @deck.cards[0]
        @turns = []
        @number_correct = 0
    end

    def take_turn(guess)
        turn = Turn.new(guess, @current_card)
        @turns << turn
        if turn.correct?
            @number_correct += 1
        end
        @current_card_index += 1
        @current_card = @deck.cards[@current_card_index]
        turn
    end

    def number_correct_by_category(category)
        @turns.count do |turn|
           turn.card.category == category && turn.correct?
        end
    end

    def percent_correct
        @number_correct.to_f / @turns.length * 100
    end

    def number_of_turns_by_category(category)
        @turns.count do |turn|
            turn.card.category == category
        end
    end
    
    def percent_correct_by_category(category)
        self.number_correct_by_category(category).to_f / self.number_of_turns_by_category(category) * 100
    end

end