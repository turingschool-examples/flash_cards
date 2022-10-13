require './card'

require './turn'

require './deck'

class Round
    attr_reader :deck, :turns
    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
        @turns_taken = 0
    end

    def current_card
        @deck.cards[0]

    end

    def take_turn(guess)
        @guess = guess
        @turns.unshift Turn.new("#{guess}", self.current_card)
        if
            @turns[0].card.answer == @turns[0].guess
            @number_correct += 1
        end
        @turns_taken += 1
        @deck.cards.shift
        return @turns[0]

    end

    def number_correct
        @number_correct
    end

    

end