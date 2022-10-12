require './card'

require './turn'

require './deck'

class Round
    attr_reader :deck, :turns
    def initialize(deck)
        @deck = deck
    end

    def current_card
        return @deck.cards[0]
    end

    def take_turn(guess)
        @guess = guess
        @turns = Turn.new("#{guess}", self.current_card)
    end
end