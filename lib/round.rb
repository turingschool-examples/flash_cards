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

end