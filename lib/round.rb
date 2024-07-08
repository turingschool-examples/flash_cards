class Round
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        @card_index = 0
        @turn_counter = 0
    end

    def current_card
        card = @deck.cards[@card_index]
        return card  
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns.push(new_turn)
        return new_turn
        # I know I'll use @card_index += 1 at some point.

    end
end