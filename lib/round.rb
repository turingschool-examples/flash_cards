class Round
    attr_reader :deck, :turns, current_card
    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card = @deck.cards.first
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, @current_card)
        @turns << new_turn
        @current_card = deck.cards[@turns.size]
        new_turn
    end
    
end