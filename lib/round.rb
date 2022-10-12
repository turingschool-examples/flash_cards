require './card'

require './turn'

require './deck'

class Round
    attr_reader :deck, :turns
    def initialize(deck)
        @deck = deck
        @number_correct = 0
    end

    def current_card
        @deck.cards[0]

    end

    def take_turn(guess)
        @guess = guess
        @turns = Turn.new("#{guess}", self.current_card)
        if
            @turns.card.answer == @turns.guess
            @number_correct += 1
        end
        @deck.cards.shift
        @turns = Turn.new("#{guess}", self.current_card)

    end

    def number_correct
        @number_correct
    end

end